import { Component, OnInit } from '@angular/core';
import {Information} from "../Information/information";
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {ConfirmationService, MessageService} from "primeng/api";
import {ProductExtraCost} from "./product-extra-cost";

@Component({
  selector: 'app-product-extra-cost',
  templateUrl: './product-extra-cost.component.html',
  styleUrls: ['./product-extra-cost.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class ProductExtraCostComponent implements OnInit {

  extracost!: ProductExtraCost;
  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.extracost=new ProductExtraCost();
    this.extracost=this.config.data.extracost;
  }


}
