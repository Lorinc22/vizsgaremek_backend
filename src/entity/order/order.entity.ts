import { Column,JoinColumn, ManyToOne,OneToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import User from "../user/user.entity";


@Entity()
export default class Order {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    price: number;

    @ManyToOne(() => User)
    @JoinColumn({ name: 'userId' })
    userId: number;

    @Column()
    city: string;

    @Column()
    street: string;

    @Column()
    houseNumber: string;

    @Column()
    postalCode: number;

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    order_date: Date;
}