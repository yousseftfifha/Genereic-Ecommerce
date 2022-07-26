import { Component, OnInit } from '@angular/core';
import {ConfirmationService, MessageService} from "primeng/api";
import {DialogService, DynamicDialogRef} from "primeng/dynamicdialog";
import {OrderCustomer} from "../OrderCustomer/OrderCustomer";
import {OrderCustomerService} from "../OrderCustomer/order-customer.service";
import {OrderCustomerItemComponent} from "../OrderCustomerItem/order-customer-item.component";
import {Mouvement} from "../Mouvement/mouvement";
import {OrderSupllier} from "./order-supllier";
import {OrderSupplierService} from "./order-supplier.service";
import {OrderSupllierItemComponent} from "../OrderSupllierItem/order-supllier-item.component";

@Component({
  selector: 'app-order-supplier',
  templateUrl: './order-supplier.component.html',
  styleUrls: ['./order-supplier.component.css'],
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
export class OrderSupplierComponent implements OnInit {

  OrderSupplierDialog!: boolean;

  SupplierOrders!: OrderSupllier[];

  SupplierOrder!: OrderSupllier;

  selectedSupplierOrder!: OrderSupllier[];

  submitted!: boolean;

  ref!: DynamicDialogRef;

  data: any;

  options: any;

  confirmed: number=0;

  pending: number=0;

  cancelled: number=0;

  constructor(private SupplierOrderservice: OrderSupplierService, private messageService: MessageService, private confirmationService: ConfirmationService,public dialogService: DialogService) { }

  ngOnInit() {
    this.SupplierOrderservice.getOrders().subscribe(data => {
      this.SupplierOrders = data;
      this.SupplierOrders.forEach((os:OrderSupllier)=>{
        if (os.status=="CONFIRMED")
          this.confirmed++;
        else if (os.status=="CANCELLED")
          this.cancelled++;
        else if (os.status=="PENDING")
          this.pending++;
      })

      this.data = {
        labels: ['PENDING','CONFIRMED','CANCELLED'],
        datasets: [
          {
            data: [this.pending, this.confirmed, this.cancelled],
            backgroundColor: [
              "#FF6384",
              "#36A2EB",
              "#FFCE56"
            ],
            hoverBackgroundColor: [
              "#FF6384",
              "#36A2EB",
              "#FFCE56"
            ]
          }]
      };
      this.options = {
        title: {
          display: true,
          text: 'STATISTICS BY STATUS',
          fontSize: 16
        },
        legend: {
          position: 'bottom'
        }
      };

    });


  }

  openNew() {
    this.SupplierOrder = new OrderSupllier();
    this.submitted = false;
    this.OrderSupplierDialog = true;
  }
  ShowOrderItem(order:OrderSupllier) {
    this.ref = this.dialogService.open(OrderSupllierItemComponent, {
      header: 'Order Items',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {orderItems: order.orderItemSuppliers}

    });

    this.ref.onClose.subscribe((mouvement: Mouvement) =>{

    });
  }

  ngOnDestroy() {
    if (this.ref) {
      this.ref.close();
    }
  }
  ConfirmOrder(order:OrderSupllier) {
    this.SupplierOrderservice.ConfirmOrder(order.id,order).subscribe( data =>{
        console.log(data);
      }
      , error => console.log(error));
    this.SupplierOrder = {...order};

    this.messageService.add({severity:'success', summary: 'Successful', detail: 'Status Updated', life: 3000});
    this.SupplierOrders = [...this.SupplierOrders];
    this.SupplierOrder= new OrderSupllier();
    this.reloadPage();
  }
  CancelOrder(order:OrderSupllier) {
    this.SupplierOrderservice.CancelOrder(order.id,order).subscribe( data =>{
        console.log(data);
      }
      , error => console.log(error));
    this.SupplierOrder = {...order};

    this.messageService.add({severity:'success', summary: 'Successful', detail: 'Status Updated', life: 3000});
    this.SupplierOrders = [...this.SupplierOrders];
    this.SupplierOrder = new OrderSupllier();
    this.reloadPage();
  }
  reloadPage(): void {
    window.location.reload();
  }
}
