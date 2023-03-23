import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export default class Restaurant {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    url: string;
}