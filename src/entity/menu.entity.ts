import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import Restaurant from "./restaurant.entity";


@Entity()
export default class Menu {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    price: number;

    @ManyToOne(() => Restaurant)
    @JoinColumn({ name: 'restaurantId' })
    restaurant: Restaurant;

}