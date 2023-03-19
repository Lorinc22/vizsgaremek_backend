import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import User from './user.entity';

@Injectable()
export class AppService {
  constructor(@InjectRepository(User) private readonly userRepository: Repository<User>)  {
  }
  async findOne(condition: any): Promise<User> {
    return this.userRepository.findOne(condition);
  }

  async findOneByEmail(email: string): Promise<User> {
    return this.userRepository.findOne({
      "where": {
          "email": email,
      },
  });
  }
}
