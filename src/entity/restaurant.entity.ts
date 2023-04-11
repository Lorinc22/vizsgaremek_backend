import { Column,JoinColumn, OneToOne, Entity, PrimaryGeneratedColumn } from "typeorm";
import Menu from "./menu.entity";

@Entity()
export default class Restaurant {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    url: string;

    @OneToOne(() => Menu)
    @JoinColumn({ name: 'MenuId' })
    menu: Menu;
}