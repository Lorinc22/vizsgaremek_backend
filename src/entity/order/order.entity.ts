import { Column,JoinColumn, ManyToOne,OneToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import User from "../user/user.entity";
import Restaurant from "../restaurant.entity";
import Cart from "../cart.entity";


@Entity()
export default class Order {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    price: number;

    @ManyToOne(() => User)
    @JoinColumn({ name: 'user_id' })
    user: User;

    @ManyToOne(() => Restaurant)
    @JoinColumn({ name: 'restaurant_id' })
    restaurant: Restaurant;





}