import { Component, OnInit } from '@angular/core';
import {Detail} from "../Detail/detail";
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {ConfirmationService, MessageService} from "primeng/api";
import {OrderCustomerItem} from "./order-customer-item";
import {Product} from "../Product/product";

@Component({
  selector: 'app-order-customer-item',
  templateUrl: './order-customer-item.component.html',
  styleUrls: ['./order-customer-item.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class OrderCustomerItemComponent implements OnInit {

  orderItem!: OrderCustomerItem[];


  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.orderItem= [];
    this.orderItem=this.config.data.orderItems;
    this.orderItem.forEach((orderItem : OrderCustomerItem, val: number)=>{
      this.productService.getPrice(orderItem.product.id).subscribe( data =>{
          val=data;
          orderItem.product.price = val;

        }
        , error => console.log(error));
    })

  }

}
