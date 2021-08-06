import { Component, OnInit } from '@angular/core';
import {Product} from "../Product/product";
import {ProductService} from "../Product/product.service";
import {DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Detail} from "./detail";

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent implements OnInit {

  products!: Product[];

  details!: Detail[];


  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.productService.getProduct().subscribe(data => {
      this.products = data;

      this.products.forEach((product : Product, val: number)=>{
      this.details=product.details;
      }
      )

    });
  }


}
