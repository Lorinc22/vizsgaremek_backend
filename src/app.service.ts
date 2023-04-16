import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import Restaurant from './entity/restaurant.entity';
import UpdateUserDto from './dto/updateuser.dto';
import User from './entity/user/user.entity';
import { UpdateUserInput } from './dto/updateuserinput.interface';
import Cart from './entity/cart.entity';
import Menu from './entity/menu.entity';
import AddItemDto from './dto/additem.dto';
import { getManager } from 'typeorm';

@Injectable()
export class AppService {
  constructor(@InjectRepository(User) private readonly userRepository: Repository<User>,
              @InjectRepository(Restaurant) private readonly restaurantRepository: Repository<Restaurant>,
              @InjectRepository(Menu) private readonly menuRepository: Repository<Menu>,
              ){}
  async findOne(condition: any): Promise<User> {
    return this.userRepository.findOne(condition);
  }

  async findUserById(id: number): Promise<User> {
    return this.userRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

  async findUserByEmail(email: string): Promise<User> {
    return this.userRepository.findOne({
      "where": {
          "email": email,
      }
  });
  }

  async findOneByRestaurant(id: number): Promise<Restaurant> {
    return this.restaurantRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

  async searchRestaurants(searchTerm: string): Promise<Restaurant[]> {
    const restaurants = await this.restaurantRepository
      .createQueryBuilder('restaurant')
      .where('restaurant.name LIKE :searchTerm', { searchTerm: `%${searchTerm}%` })
      .getMany();
    return restaurants;
  }

  async findAllRestaurant(): Promise<Restaurant> {
    const restaurants = await this.restaurantRepository.find();
    const restaurantArray = JSON.parse(JSON.stringify(restaurants))
    return restaurantArray;
  }

  async getMenusByRestaurant(restaurantId: number): Promise<Menu[]> {
    const menus = await this.menuRepository
      .createQueryBuilder('menu')
      .leftJoinAndSelect('menu.restaurant', 'restaurant')
      .where('restaurant.id = :restaurantId', { restaurantId })
      .getMany();
    return menus;
  }

  async updateAccountInfo(id: number, updateUserDto: UpdateUserDto): Promise<User>{
    await this.userRepository.update(id,updateUserDto)
    return await this.userRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

  async updateUserPassword(id: number, password: string): Promise<User>{
    const updates: UpdateUserInput = { password };
  await this.userRepository.update(id, updates);
    return await this.userRepository.findOne({
      "where": {
        "id": id,
      } 
    });
  }

}
