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
    @JoinColumn({ name: 'userId' })
    user: User;

    @Column()
    city: string;

    @Column()
    street: string;

    @Column()
    houseNumber: string;

    @Column()
    postalCode: number;
}