import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import Restaurant from './entity/restaurant.entity';
import UpdateUserDto from './dto/updateuser.dto';
import User from './entity/user/user.entity';

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
    return restaurantArray;
  }

  async findOneByEmail(email: string): Promise<User> {
    return this.userRepository.findOne({
      "where": {
          "email": email,
      },
  });
  }

  async updateAccountInfo(id: number, updateUserDto: UpdateUserDto): Promise<User>{
    await this.userRepository.update(id,updateUserDto)
    return await this.userRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

  async findOneByUser(id: number): Promise<User> {
    return this.userRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

}
