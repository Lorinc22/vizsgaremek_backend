import { Column,JoinColumn, OneToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import Order from "./order/order.entity";

@Entity()
export default class Cart {
    @PrimaryGeneratedColumn()
    id: number;

    @OneToOne(() => Order)
    @JoinColumn({ name: 'order_id' })
    order: Order;

}