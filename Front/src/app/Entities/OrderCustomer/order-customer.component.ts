import { Component, OnInit } from '@angular/core';
import {ConfirmationService, MessageService} from "primeng/api";
import {DialogService, DynamicDialogRef} from "primeng/dynamicdialog";
import {Category} from "../Category/category";
import {CategoryService} from "../Category/category.service";
import {OrderCustomer} from "./OrderCustomer";
import {OrderCustomerService} from "./order-customer.service";
import {Product} from "../Product/product";
import {ProductExtraCostComponent} from "../ProductExtraCost/product-extra-cost.component";
import {Mouvement} from "../Mouvement/mouvement";
import {OrderCustomerItemComponent} from "../OrderCustomerItem/order-customer-item.component";

@Component({
  selector: 'app-order-customer',
  templateUrl: './order-customer.component.html',
  styleUrls: ['./order-customer.component.css'],
  styles: [`
        :host ::ng-deep .p-dialog .product-image {
            width: 150px;
            margin: 0 auto 2rem auto;
            display: block;
        }
        :host ::ng-deep .p-button {
          margin: 0 .5rem .5rem 0;
          min-width: 1rem;
        }
    `],
  providers: [MessageService,ConfirmationService,DialogService]
})
export class OrderCustomerComponent implements OnInit {
  OrderCustomerDialog!: boolean;

  CustomerOrders!: OrderCustomer[];

  CustomerOrder!: OrderCustomer;

  selectedCustomerOrder!: OrderCustomer[];

  submitted!: boolean;

  ref!: DynamicDialogRef;

  constructor(private customerOrderService: OrderCustomerService, private messageService: MessageService, private confirmationService: ConfirmationService,public dialogService: DialogService) { }

  ngOnInit() {
    this.customerOrderService.getOrders().subscribe(data => {
      this.CustomerOrders = data;
    });
  }

  openNew() {
    this.CustomerOrder = new OrderCustomer();
    this.submitted = false;
    this.OrderCustomerDialog = true;
  }
  ShowOrderItem(order:OrderCustomer) {
    this.ref = this.dialogService.open(OrderCustomerItemComponent, {
      header: 'Order Items',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {orderItems: order.orderCustomerItems}

    });

    this.ref.onClose.subscribe((mouvement: Mouvement) =>{

    });
  }

  ngOnDestroy() {
    if (this.ref) {
      this.ref.close();
    }
  }
  ConfirmOrder(order:OrderCustomer) {
      this.customerOrderService.ConfirmOrder(order.id,order).subscribe( data =>{
          console.log(data);
        }
        , error => console.log(error));
      this.CustomerOrder = {...order};

    this.messageService.add({severity:'success', summary: 'Successful', detail: 'Status Updated', life: 3000});
    this.CustomerOrders = [...this.CustomerOrders];
    this.CustomerOrder = new OrderCustomer();
    this.reloadPage();
  }
  CancelOrder(order:OrderCustomer) {
    this.customerOrderService.CancelOrder(order.id,order).subscribe( data =>{
        console.log(data);
      }
      , error => console.log(error));
    this.CustomerOrder = {...order};

    this.messageService.add({severity:'success', summary: 'Successful', detail: 'Status Updated', life: 3000});
    this.CustomerOrders = [...this.CustomerOrders];
    this.CustomerOrder = new OrderCustomer();
    this.reloadPage();
  }
  reloadPage(): void {
    window.location.reload();
  }
}
