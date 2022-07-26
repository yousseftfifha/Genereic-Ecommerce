import { Component, OnInit } from '@angular/core';
import {SupplierService} from "./supplier.service";
import {Router} from "@angular/router";
import {Supplier} from "./supplier";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-Suppliers-list',
  templateUrl: './suppliers.component.html',
  styleUrls: ['./suppliers.component.css'],
  styles: [`
        :host ::ng-deep .p-dialog .product-image {
            width: 150px;
            margin: 0 auto 2rem auto;
            display: block;
        }
    `],
  providers: [MessageService,ConfirmationService]

})
export class SuppliersComponent implements OnInit {
  suppliers!: Supplier[];
  supplier!:Supplier;
  selectedSuppliers!:Supplier[];
  submitted!:boolean;
  supplierDialog!: boolean;
  category!:any;
  legalStatus!:any;
  finality!:any;
  size!:any;
  sector!:any;
  scope!:any;

  constructor(private supplierService: SupplierService,
              private router:Router,
              private messageService: MessageService,
              private confirmationService: ConfirmationService) { }

  ngOnInit() {
    this.supplierService.getSuppliers().subscribe(data => this.suppliers = data);

    this.category = [
      {label: 'Enterprise', value: 'Enterprise'},
      {label: 'Organization', value: 'Organization'},
      {label: 'Association', value: 'Association'},
      {label: 'Public', value: 'Public'}
    ];
    this.legalStatus = [
      {label: 'Entrepreneur', value: 'Entrepreneur'},
      {label: 'individual Enterprise', value: 'individual Enterprise '},
      {label: 'Society', value: 'Society'}
    ];
    this.finality = [
      {label: 'Economical', value: 'Economical'},
      {label: 'Social', value: 'Social'},
      {label: 'societal', value: 'societal'}
    ];
    this.size = [
      {label: 'Micro', value: 'Micro'},
      {label: 'Very Small', value: 'Very Small'},
      {label: 'Small', value: 'Small'},
      {label: 'Average', value: 'Average'},
      {label: 'Big', value: 'Big'},
    ];
    this.sector = [
      {label: 'Primary', value: 'Primary'},
      {label: 'Secondary', value: 'Secondary'},
      {label: 'Tertiary', value: 'Tertiary'},
      {label: 'Ntics', value: 'Ntics'},
    ];
    this.scope = [
      {label: 'Human', value: 'Human'},
      {label: 'Financial', value: 'Financial'},
      {label: 'Material', value: 'Material'},
      {label: 'Immaterial', value: 'Immaterial'},
    ];
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
    this.supplierService.updateSupplier(supplier.id,supplier).subscribe( data =>{
        console.log(data);
      }
      , error => console.log(error));
    this.supplier = {...supplier};
    this.supplierDialog = true;

  }

  deleteSupplier(supplier: Supplier) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + supplier.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.supplierService.DeleteSupplier(supplier.id).subscribe(
          data=>{
            console.log(data);

          }
        )
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
        this.supplierService.createSupplier(this.supplier).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Supplier Updated', life: 3000});
      }
      else {
        this.supplierService.createSupplier(this.supplier).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
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

  reloadPage(): void {
    window.location.reload();
  }
}
