import { Column, Entity, JoinColumn, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import Address from "./address.entity";

@Entity()
export default class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    email: string;

    @Column()
    firstName: string;

    @Column()
    lastName: string;

    @Column()
    password: string;

    @Column()
    rePassword: string;

    @OneToOne(() => Address)
    @JoinColumn({ name: 'addressId' })
    address: Address;
}