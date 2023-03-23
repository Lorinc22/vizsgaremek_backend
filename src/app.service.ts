import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import Restaurant from './restaurant.entity';
import User from './user.entity';

@Injectable()
export class AppService {
  constructor(@InjectRepository(User) private readonly userRepository: Repository<User>,
              @InjectRepository(Restaurant) private readonly restaurantRepository: Repository<Restaurant>,
              ){}
  async findOne(condition: any): Promise<User> {
    return this.userRepository.findOne(condition);
  }

  async findOneByRestaurant(id: number): Promise<Restaurant> {
    return this.restaurantRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

  async findAllRestaurant(): Promise<Restaurant> {
    const restaurants = await this.restaurantRepository.find();
    const restaurantArray = JSON.parse(JSON.stringify(restaurants))
    //const restaurantArray = Object.getOwnPropertyNames(restaurants);
    return restaurantArray;
  }

  async findOneByEmail(email: string): Promise<User> {
    return this.userRepository.findOne({
      "where": {
          "email": email,
      },
  });
  }
}
