import { Column,JoinColumn, OneToOne, Entity, PrimaryGeneratedColumn, OneToMany } from "typeorm";
import Menu from "./menu.entity";

@Entity()
export default class Restaurant {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    url: string;
}