import { Module, Res } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt/dist';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import Restaurant from './entity/restaurant.entity';
import User from './entity/user/user.entity';
import Address from './entity/user/address.entity';
import Menu from './entity/menu.entity';
import Order from './entity/order/order.entity';
import Cart from './entity/cart.entity';
import OrderItem from './entity/orederitem.entity';


@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      username: 'root',
      password: '',
      database: 'gorillago',
      entities: [
        User,
        Restaurant,
        Address,
        Menu,
        Order,
        Cart,
        OrderItem
      ],
      synchronize: true,
    }),
    TypeOrmModule.forFeature([User, Restaurant, Menu]),
    JwtModule.register({
      secret: 'secret',
      signOptions: {expiresIn: '1d'}
    })
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
