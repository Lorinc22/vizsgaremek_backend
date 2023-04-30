import { BadRequestException, Body, Controller, Get, HttpCode, Param, Patch, Post, Put, Render, Req, Res } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { AppService } from './app.service';
import RegisterDto from './dto/register.dto';
import LoginDto from './dto/login.dto';
import User from './entity/user/user.entity';
import * as bcrypt from 'bcrypt'
import { JwtService } from '@nestjs/jwt';
import { Response} from 'express';
import Restaurant from './entity/restaurant.entity';
import UpdateUserDto from './dto/updateuser.dto';
import UpdateUserPasswordDto from './dto/updateuserpassword.dto';
import Menu from './entity/menu.entity';
import OrderDto from './dto/order.dto';
import Order from './entity/order/order.entity';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private dataSource: DataSource,
    private jwtService: JwtService 
  ) {}

  @Get('users/:id')
  async findUserById(@Param('id') id: number ){
    return await (await this.appService.findUserById(id));
  }

  @Get('userbyemail/:email')
  async findUserByEmail(@Param('email') email: string){
    return await (await this.appService.findUserByEmail(email));
  }

  @Get('restaurants')
  async getAllRestaurant(){
    return await (await this.appService.findAllRestaurant());
  }

  @Get('getAllRestaurants')
  getAllRestaurants(){
    return this.appService.findAllRestaurant()
  }

  @Get('restaurant/:id')
  async getRestaurant(@Param('id') id: number ){
    const restaurantRepo = this.dataSource.getRepository(Restaurant);
    return await (await this.appService.findOneByRestaurant(id));
  }

  @Get('restaurants/:id/menus')
async getMenusByRestaurant(@Param('id') restaurantId: number): Promise<Menu[]> {
  const menus = await this.appService.getMenusByRestaurant(restaurantId);
  return menus;
}

  @Get('restaurants/search/:searchTerm')
  async searchRestaurants(@Param('searchTerm') searchTerm: string) {
  const restaurants = await this.appService.searchRestaurants(searchTerm);
  return restaurants;
}

  @Post('/register')
  @HttpCode(200)
  async register(@Body() registerDto: RegisterDto){
    if(!registerDto.email||
      !registerDto.password || !registerDto.rePassword){
        throw new BadRequestException('Minden mező kitöltése kötelező');
      }
    if(!registerDto.email.includes('@')){
      throw new BadRequestException('Emailnek tartalmaznia kell @ karaktert');
    }
    if(registerDto.password !== registerDto.rePassword){
      throw new BadRequestException('A két jelszónak egyeznie kell');
    }
    if(registerDto.password.length < 8){
      throw new BadRequestException('A jelszónak minimum 8 karakternek kell lennie');
    }
   const userTaken = await this.appService.findUserByEmail(registerDto.email);
   if(userTaken){
    throw new BadRequestException('Az email cím már foglalt');
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
    @Body() loginDto: LoginDto,
    @Res({passthrough: true}) response: Response
    ){
    const user = await this.appService.findUserByEmail(loginDto.email);

    if(!user){
      throw new BadRequestException('Nem található felshasználó');
    }

    if(!await bcrypt.compare(loginDto.password, user.password)){
      throw new BadRequestException('Hibás jelszó');
    }

    const jwt = await this.jwtService.signAsync({id: user.id, firstName: user.firstName, lastName: user.lastName});
    response.cookie('jwt', jwt, {httpOnly: true})

    return {
      token: jwt,
      userId: user.id,
    };
  }

  @Post('order')
  async submitOrder(@Body() OrderDto: OrderDto){
    try{
    const orderRepo = this.dataSource.getRepository(Order)
    const order = new Order()
    order.userId = OrderDto.userId
    order.price = OrderDto.price;
    order.city = OrderDto.city;
    order.street = OrderDto.street;
    order.houseNumber = OrderDto.houseNumber;
    order.postalCode = OrderDto.postalCode;
    order.order_date = new Date();
    return orderRepo.save(order)
    }
    catch(e){
      return e
    }
  }

  @Put('users/:id')
  async updateAccountInfo(@Param('id') id: number,@Body() updateUserDto: UpdateUserDto){
    return await( await this.appService.updateAccountInfo(id,updateUserDto));
  }

  @Put('users/password/:id')
  async updateUserPassword(@Param('id') id: number, @Body() updateUserPasswordDto: UpdateUserPasswordDto) {
  const user = await this.appService.findUserById(id);
  if (!user) {
    throw new BadRequestException('Nem található a felhasználó.');
  }
  if(!await bcrypt.compare(updateUserPasswordDto.oldPassword, user.password)){
    throw new BadRequestException('Hibás jelszó.');
  }
  if(updateUserPasswordDto.newPassword.length < 8){
    throw new BadRequestException('A jelszónak 8 karakter hosszúnak kell minimum lennie.');
  }
  const password = await bcrypt.hash(updateUserPasswordDto.newPassword, 15 );
  return await( await this.appService.updateUserPassword(id,password));
}
}
