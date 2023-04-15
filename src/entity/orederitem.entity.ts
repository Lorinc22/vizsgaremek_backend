import { Column,JoinColumn, ManyToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import Order from "./order/order.entity";
import Menu from "./menu.entity";

@Entity()
export default class OrderItem {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    quantity: number;

    @ManyToOne(() => Menu)
    @JoinColumn({ name: 'menuId' })
    menu: Menu;

    @ManyToOne(() => Order)
    @JoinColumn({ name: 'orderId' })
    order: Order;

}