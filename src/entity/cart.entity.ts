import { Column,JoinColumn, ManyToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import Order from "./order/order.entity";
import User from "./user/user.entity";
import Menu from "./menu.entity";

@Entity()
export default class Cart {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    quantity: number;

    @ManyToOne(() => User)
    @JoinColumn({ name: 'userId' })
    user: User;

    @ManyToOne(() => Menu)
    @JoinColumn({ name: 'menuId' })
    menu: Menu;

}