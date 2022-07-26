import { Component, OnInit } from '@angular/core';
import {ConfirmationService, MessageService} from "primeng/api";
import {Supplier} from "../Suppliers/supplier";
import {SupplierService} from "../Suppliers/supplier.service";
import {Router} from "@angular/router";
import {DeliveryCustomerService} from "./delivery-customer.service";
import {DeliveryCustomer} from "./delivery-customer";
import {Product} from "../Product/product";
import {DetailComponent} from "../Detail/detail.component";
import {Detail} from "../Detail/detail";
import {DialogService, DynamicDialogRef} from "primeng/dynamicdialog";
import {DeliveryCustomerItemComponent} from "../DeliveryCustomerItem/delivery-customer-item.component";
import {DeliveryCustomerItem} from "../DeliveryCustomerItem/delivery-customer-item";

@Component({
  selector: 'app-delivery-customer',
  templateUrl: './delivery-customer.component.html',
  styleUrls: ['./delivery-customer.component.css'],
  styles: [`
        :host ::ng-deep .p-dialog .product-image {
            width: 150px;
            margin: 0 auto 2rem auto;
            display: block;
        }
    `],
  providers: [MessageService,ConfirmationService,DialogService]
})
export class DeliveryCustomerComponent implements OnInit {
  deliveryCustomers!: DeliveryCustomer[];
  deliveryCustomer!:DeliveryCustomer;
  dcitem!:DeliveryCustomerItem;
  selectedDc!:DeliveryCustomer[];
  submitted!:boolean;
  DCDialog!: boolean;
  ref!: DynamicDialogRef;

  constructor(private DCservice: DeliveryCustomerService,
              private router:Router,
              private messageService: MessageService,
              private confirmationService: ConfirmationService,
              public dialogService: DialogService) { }

  ngOnInit() {
    this.DCservice.getDelivery().subscribe(data => this.deliveryCustomers = data);

  }
  openNew() {
    this.deliveryCustomer =new DeliveryCustomer();
    this.submitted = false;
    this.DCDialog= true;
  }
  deleteSelectedDeliveryCustomer() {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete the selected DeliveryCustomer?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.deliveryCustomers = this.deliveryCustomers.filter(val => !this.selectedDc.includes(val));
        this.selectedDc = [];
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'DeliveryCustomer Deleted', life: 3000});
      }
    });
  }
  editDeliveryCustomer(supplier: DeliveryCustomer) {

    this.deliveryCustomer = {...supplier};
    this.DCDialog = true;

  }

  deleteDeliveryCustomer(supplier: Supplier) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + supplier.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.deliveryCustomers = this.deliveryCustomers.filter(val => val.id !== supplier.id);
        this.deliveryCustomer = new DeliveryCustomer();

        this.messageService.add({severity:'success', summary: 'Successful', detail: 'DeliveryCustomer Deleted', life: 3000});
      }
    });
  }

  hideDialog() {
    this.DCDialog = false;
    this.submitted = false;
  }

  saveDeliveryCustomer() {
    this.submitted = true;

    if (this.deliveryCustomer.deliveryNumber.trim()) {
      if (this.deliveryCustomer.id) {
        this.deliveryCustomers[this.findIndexById(this.deliveryCustomer.id)] = this.deliveryCustomer;

        this.messageService.add({severity:'success', summary: 'Successful', detail: 'DeliveryCustomer Updated', life: 3000});
      }
      else {

        this.deliveryCustomers.push(this.deliveryCustomer);
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'DeliveryCustomer Created', life: 3000});
      }

      this.deliveryCustomers = [...this.deliveryCustomers];
      this.DCDialog = false;
      this.deliveryCustomer = new DeliveryCustomer();
    }
  }

  findIndexById(id: number): number {
    let index = -1;
    for (let i = 0; i < this.deliveryCustomers.length; i++) {
      if (this.deliveryCustomers[i].id === id) {
        index = i;
        break;
      }
    }

    return index;
  }

  reloadPage(): void {
    window.location.reload();
  }
  show(delivery:DeliveryCustomer) {

    this.ref = this.dialogService.open(DeliveryCustomerItemComponent, {
      header: 'Product Details',
      width: '75%',
      contentStyle: {"max-height": "700px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {itemss: delivery.deliveryCustomerItems}


    });

    this.ref.onClose.subscribe((details: Detail) =>{

    });
  }
}
