import { BadRequestException, Body, Controller, Get, HttpCode, Param, Patch, Post, Render, Req, Res } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { AppService } from './app.service';
import RegisterDto from './register.dto';
import User from './user.entity';
import * as bcrypt from 'bcrypt'
import { JwtService } from '@nestjs/jwt';
import { Response} from 'express';
import Restaurant from './restaurant.entity';
import UpdateUserDto from './updateuser.dto';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private dataSource: DataSource,
    private jwtService: JwtService 
  ) {}

  @Get()
  @Render('index')
  index() {
    return { message: 'Welcome to the homepage' };
  }

  @Post('/register')
  @HttpCode(200)
  async register(@Body() registerDto: RegisterDto){
    if(!registerDto.email||
      !registerDto.password || !registerDto.rePassword){
        throw new BadRequestException('All fields are required');
      }
    if(!registerDto.email.includes('@')){
      throw new BadRequestException('Email must contain a @ character');
    }
    if(registerDto.password !== registerDto.rePassword){
      throw new BadRequestException('The two passwords must match');
    }
    if(registerDto.password.length < 8){
      throw new BadRequestException('The password must be at least 8 characters long');
    }
   const userTaken = await this.appService.findOneByEmail(registerDto.email);
   if(userTaken){
    throw new BadRequestException('The email is alredy taken');
   }
   const userRepo = this.dataSource.getRepository(User);
   const user = new User();
   user.email = registerDto.email;
   user.fullname = "";
   user.address = "";
   user.password = await bcrypt.hash(registerDto.password, 15 );
   await userRepo.save(user);

    return user;
  }

  @Post('/login')
  async login(
    @Body('email') email: string,
    @Body('password') password: string,
    @Res({passthrough: true}) response: Response
    ){
    const user = await this.appService.findOneByEmail(email);

    if(!user){
      throw new BadRequestException('Hibás bejelentkezés');
    }

    if(!await bcrypt.compare(password, user.password)){
      throw new BadRequestException('Hibás bejelentkezés');
    }

    const jwt = await this.jwtService.signAsync({id: user.id});
    response.cookie('jwt', jwt, {httpOnly: true})

    return {
      token: jwt
    };
  }

  @Patch('users/:id')
  async updateAccountInfo(@Param('id') id: number,@Body() updateUserDto: UpdateUserDto){
    
    return await( await this.appService.updateAccountInfo(id,updateUserDto));
  }

  @Get('restaurant/:id')
  async getRestaurant(@Param('id') id: number ){
    const restaurantRepo = this.dataSource.getRepository(Restaurant);
    return await (await this.appService.findOneByRestaurant(id));
  }

  @Get('restaurants')
  async getAllRestaurant(){
    return await (await this.appService.findAllRestaurant());
  }

  
}
