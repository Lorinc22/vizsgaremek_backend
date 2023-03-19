import { BadRequestException, Body, Controller, Get, HttpCode, Param, Patch, Post, Render, Req, Res } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { AppService } from './app.service';
import RegisterDto from './register.dto';
import User from './user.entity';
import * as bcrypt from 'bcrypt'
import { JwtService } from '@nestjs/jwt';
import { Response} from 'express';

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
      !registerDto.password || !registerDto.rePassword ){
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

   const userRepo = this.dataSource.getRepository(User);
   const user = new User();
   user.email = registerDto.email;
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
      throw new BadRequestException('Invalid credentials');
    }

    if(!await bcrypt.compare(password, user.password)){
      throw new BadRequestException('Invalid credentials');
    }

    const jwt = await this.jwtService.signAsync({id: user.id});
    response.cookie('jwt', jwt, {httpOnly: true})

    return {
      token: jwt
    };
  }
}
