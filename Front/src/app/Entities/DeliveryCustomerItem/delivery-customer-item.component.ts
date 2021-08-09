import { Component, OnInit } from '@angular/core';
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {ConfirmationService, MessageService} from "primeng/api";
import {Detail} from "../Detail/detail";
import {DeliveryCustomerItem} from "./delivery-customer-item";

@Component({
  selector: 'app-delivery-customer-item',
  templateUrl: './delivery-customer-item.component.html',
  styleUrls: ['./delivery-customer-item.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class DeliveryCustomerItemComponent implements OnInit {

  items!: DeliveryCustomerItem[];

  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.items= [];
    this.items=this.config.data.itemss;

  }


}
