import { Component, OnInit } from '@angular/core';
import {Product} from "./product";
import {ConfirmationService, MessageService, SelectItem} from "primeng/api";
import {ProductService} from "./product.service";
import {Router} from "@angular/router";
import {Supplier} from "../Suppliers/supplier";
import {DialogService, DynamicDialogRef} from "primeng/dynamicdialog";
import {DetailComponent} from "../Detail/detail.component";
import {Detail} from "../Detail/detail";
import {Information} from "../Information/information";
import {InformationComponent} from "../Information/information.component";
import {MouvementComponent} from "../Mouvement/mouvement.component";
import {Mouvement} from "../Mouvement/mouvement";

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css'],
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
export class ProductComponent implements OnInit {

  productDialog!: boolean;

  products!: Product[];

  product!: Product;

  selectedProducts!: Product[];

  submitted!: boolean;

  price!: number;

  ref!: DynamicDialogRef;


  constructor(private productService: ProductService, private messageService: MessageService, private confirmationService: ConfirmationService,public dialogService: DialogService,) { }

  ngOnInit() {
    this.productService.getProduct().subscribe(data => {
      this.products = data;
      this.products.forEach((product : Product, val: number)=>{
        this.productService.getPrice(product.id).subscribe( data =>{
            val=data;
            product.price = val;

          }
          , error => console.log(error));
      })

    });
  }

  openNew() {
    this.product = new Product();
    this.submitted = false;
    this.productDialog = true;
  }

  deleteSelectedProducts() {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete the selected products?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.products = this.products.filter(val => !this.selectedProducts.includes(val));
        this.selectedProducts = [];
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Products Deleted', life: 3000});
      }
    });
  }
  getPrice(product: Product) {
    this.productService.getPrice(product.id).subscribe( data =>{
      this.price=data;
        console.log(data);
      }
      , error => console.log(error));
    return this.price;
  }
  editProduct(product: Product) {
    this.product = {...product};
    this.productDialog = true;
  }

  deleteProduct(product: Product) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + product.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.products = this.products.filter(val => val.id !== product.id);
        this.product = new Product();
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Deleted', life: 3000});
      }
    });
  }

  hideDialog() {
    this.productDialog = false;
    this.submitted = false;
  }

  saveProduct() {
    this.submitted = true;

    if (this.product.name.trim()) {
      if (this.product.id) {
        this.products[this.findIndexById(this.product.id)] = this.product;
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Updated', life: 3000});
      }
      else {
        this.products.push(this.product);
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Created', life: 3000});
      }

      this.products = [...this.products];
      this.productDialog = false;
      this.product = new Product();
    }
  }

  findIndexById(id: number): number {
    let index = -1;
    for (let i = 0; i < this.products.length; i++) {
      if (this.products[i].id === id) {
        index = i;
        break;
      }
    }

    return index;
  }

  show() {
    this.ref = this.dialogService.open(DetailComponent, {
      header: 'Product Details',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000
    });

    this.ref.onClose.subscribe((details: Detail) =>{

    });
  }
  showInfo() {
    this.ref = this.dialogService.open(InformationComponent, {
      header: 'Product Information',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000
    });

    this.ref.onClose.subscribe((information: Information) =>{

    });
  }
  showMvt() {
    this.ref = this.dialogService.open(MouvementComponent, {
      header: 'Product Mouvement',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000
    });

    this.ref.onClose.subscribe((mouvement: Mouvement) =>{

    });
  }

  ngOnDestroy() {
    if (this.ref) {
      this.ref.close();
    }
  }
}
