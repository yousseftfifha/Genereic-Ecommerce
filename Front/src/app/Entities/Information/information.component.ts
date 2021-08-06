import { Component, OnInit } from '@angular/core';
import {ProductService} from "../Product/product.service";
import {DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Product} from "../Product/product";
import {Information} from "./information";

@Component({
  selector: 'app-information',
  templateUrl: './information.component.html',
  styleUrls: ['./information.component.css']
})
export class InformationComponent implements OnInit {
  products!: Product[];

  info!: Information;
  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.productService.getProduct().subscribe(data => {
      this.products = data;

      this.products.forEach((product : Product, val: number)=>{
          this.info=product.information;
        }
      )

    });
  }

}
