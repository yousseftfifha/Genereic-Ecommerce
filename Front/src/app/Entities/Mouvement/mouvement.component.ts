import { Component, OnInit } from '@angular/core';
import {Product} from "../Product/product";
import {Detail} from "../Detail/detail";
import {ProductService} from "../Product/product.service";
import {DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Mouvement} from "./mouvement";

@Component({
  selector: 'app-mouvement',
  templateUrl: './mouvement.component.html',
  styleUrls: ['./mouvement.component.css']
})
export class MouvementComponent implements OnInit {

  products!: Product[];

  mouvments!: Mouvement[];


  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.productService.getProduct().subscribe(data => {
      this.products = data;

      this.products.forEach((product : Product, val: number)=>{
          this.mouvments=product.mouvements;
        }
      )

    });
  }



}
