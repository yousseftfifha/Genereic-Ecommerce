import { Component, OnInit } from '@angular/core';
import {OrderCustomerItem} from "../OrderCustomerItem/order-customer-item";
import {ProductService} from "../Product/product.service";
import {DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {OrderSupllierItem} from "./order-supllier-item";

@Component({
  selector: 'app-order-supllier-item',
  templateUrl: './order-supllier-item.component.html',
  styleUrls: ['./order-supllier-item.component.css']
})
export class OrderSupllierItemComponent implements OnInit {

  orderItem!: OrderSupllierItem[];


  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.orderItem= [];
    this.orderItem=this.config.data.orderItems;
    this.orderItem.forEach((orderItem : OrderSupllierItem, val: number)=>{
      this.productService.getPrice(orderItem.product.id).subscribe( data =>{
          val=data;
          orderItem.product.price = val;

        }
        , error => console.log(error));
    })

  }

}
