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
import AddressDto from './dto/address.dto';
import UpdateUserPasswordDto from './dto/updateuserpassword.dto';
import AddToCartDto from './dto/addtocart.dto';
import Cart from './entity/cart.entity';
import Menu from './entity/menu.entity';

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

  @Get('restaurants/:searchTerm')
  async searchRestaurants(@Param('searchTerm') searchTerm: string) {
  const restaurants = await this.appService.searchRestaurants(searchTerm);
  return restaurants;
}

  @Get('user/address/:id')
  async getUserAddress(@Param('id') id: number ){
    const userRepo = this.dataSource.getRepository(User);
    const user = await userRepo
    .createQueryBuilder('user')
    .leftJoinAndSelect('user.address', 'address')
    .where('address.id = :id', { id: id })
    .getOne();
    return user.address;
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
   const userTaken = await this.appService.findUserByEmail(registerDto.email);
   if(userTaken){
    throw new BadRequestException('The email is alredy taken');
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
      throw new BadRequestException('Hibás bejelentkezés');
    }

    if(!await bcrypt.compare(loginDto.password, user.password)){
      throw new BadRequestException('Hibás bejelentkezés');
    }

    const jwt = await this.jwtService.signAsync({id: user.id});
    response.cookie('jwt', jwt, {httpOnly: true})

    return {
      token: jwt,
      userId: user.id,
    };
  }

  @Post('user:id/address')
  async addAddress(@Body() addressDto: AddressDto, @Param('id') id: number ) {
    console.log(addressDto);
    const userRepo = this.dataSource.getRepository(User).findOneBy({ id: id})
  }

  @Post('cart')
  async addToCart(@Body() addToCartDto: AddToCartDto, @Param('userId') userId:number, @Param('menuId') menuId:number) {
    const cartRepo = this.dataSource.getRepository(Cart);
    let cartItem = await this.appService.findCartMenuId(menuId);
    if (cartItem) {
      const q = typeof addToCartDto.quantity == 'string' ? parseInt(addToCartDto.quantity) : addToCartDto.quantity;
      cartItem.quantity += q;
    } else {
      // Otherwise, create a new cart item
      cartItem = new Cart();
      cartItem.user = await this.appService.findUserById(userId);
      cartItem.menu = await this.appService.findMenuById(menuId);
      cartItem.quantity = typeof addToCartDto.quantity == 'string' ? parseInt(addToCartDto.quantity) : addToCartDto.quantity;
    }
    await cartRepo.save(cartItem);
  }
  
  @Put('users/:id')
  async updateAccountInfo(@Param('id') id: number,@Body() updateUserDto: UpdateUserDto){
    
    return await( await this.appService.updateAccountInfo(id,updateUserDto));
  }

  @Put('users/password/:id')
  async updateUserPassword(@Param('id') id: number,@Body() updateUserPasswordDto: UpdateUserPasswordDto){

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
    // return await( await this.appService.updateUserPassword(id,password));
    try{
      const password = await bcrypt.hash(updateUserPasswordDto.newPassword, 15 );
      return true
    }
    catch(e){
      return false
    }
  }

  @Get('getAllRestaurants')
  getAllRestaurants(){
    return this.appService.findAllRestaurant()
  }
}
