import { Component, OnInit } from '@angular/core';
import {SupplierService} from "../Supplier.service";
import {Router} from "@angular/router";
import {Supplier} from "../supplier";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-Suppliers-list',
  templateUrl: './Suppliers-list.component.html',
  styleUrls: ['./Suppliers-list.component.css'],
  styles: [`
        :host ::ng-deep .p-dialog .product-image {
            width: 150px;
            margin: 0 auto 2rem auto;
            display: block;
        }
    `],
  providers: [MessageService,ConfirmationService]

})
export class SuppliersListComponent implements OnInit {
  suppliers!: Supplier[];
  supplier!:Supplier;
  selectedSuppliers!:Supplier[];
  submitted!:boolean;
  supplierDialog!: boolean;

  constructor(private supplierService: SupplierService,
              private router:Router,
              private messageService: MessageService,
              private confirmationService: ConfirmationService) { }

  ngOnInit() {
    this.supplierService.getSuppliers().subscribe(data => this.suppliers = data);
  }
  openNew() {
    this.supplier =new Supplier();
    this.submitted = false;
    this.supplierDialog= true;
  }
  deleteSelectedSuppliers() {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete the selected suppliers?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.suppliers = this.suppliers.filter(val => !this.selectedSuppliers.includes(val));
        this.selectedSuppliers = [];
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Suppliers Deleted', life: 3000});
      }
    });
  }
  editSupplier(supplier: Supplier) {
    this.supplier = {...supplier};
    this.supplierDialog = true;
  }

  deleteSupplier(supplier: Supplier) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + supplier.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.suppliers = this.suppliers.filter(val => val.id !== supplier.id);
        this.supplier = new Supplier();
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Supplier Deleted', life: 3000});
      }
    });
  }

  hideDialog() {
    this.supplierDialog = false;
    this.submitted = false;
  }

  saveSupplier() {
    this.submitted = true;

    if (this.supplier.name.trim()) {
      if (this.supplier.id) {
        this.suppliers[this.findIndexById(this.supplier.id)] = this.supplier;
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Supplier Updated', life: 3000});
      }
      else {
        this.suppliers.push(this.supplier);
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Supplier Created', life: 3000});
      }

      this.suppliers = [...this.suppliers];
      this.supplierDialog = false;
      this.supplier = new Supplier();
    }
  }

  findIndexById(id: number): number {
    let index = -1;
    for (let i = 0; i < this.suppliers.length; i++) {
      if (this.suppliers[i].id === id) {
        index = i;
        break;
      }
    }

    return index;
  }


}
