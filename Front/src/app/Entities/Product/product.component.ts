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
import {ProductExtraCostComponent} from "../ProductExtraCost/product-extra-cost.component";
import * as FileSaver from "file-saver";
import {OrderSupplierService} from "../OrderSupplier/order-supplier.service";
import {Category} from "../Category/category";
import {CategoryService} from "../Category/category.service";
import {ProductExtraCost} from "../ProductExtraCost/product-extra-cost";
import {SupplierService} from "../Suppliers/supplier.service";
import {animate, state, style, transition, trigger} from "@angular/animations";
import {Params} from "./params";
import {ProductSupplier} from "../ProductSupplier/product-supplier";
import {templateJitUrl} from "@angular/compiler";
import {ProductImage} from "../ProductImage/product-image";
declare const require: any;
const jsPDF = require('jspdf');
require('jspdf-autotable');
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
        .box {
          background-color: var(--surface-e);
          text-align: center;
          padding-top: 1rem;
          padding-bottom: 1rem;
          border-radius: 4px;
          box-shadow: 0 2px 1px -1px rgba(0,0,0,.2), 0 1px 1px 0 rgba(0,0,0,.14), 0 1px 3px 0 rgba(0,0,0,.12);
        }

        .box-stretched {
          height: 100%;
        }

        .vertical-container {
          margin: 0;
          height: 200px;
          background: var(--surface-d);
          border-radius: 4px;
        }

        .nested-grid .p-col-4 {
          padding-bottom: 1rem;
        }
    `],
  animations: [
    trigger('animation', [
      state('visible', style({
        transform: 'translateX(0)',
        opacity: 1
      })),
      transition('void => *', [
        style({transform: 'translateX(50%)', opacity: 0}),
        animate('300ms ease-out')
      ]),
      transition('* => void', [
        animate(('250ms ease-in'), style({
          height: 0,
          opacity: 0,
          transform: 'translateX(50%)'
        }))
      ])
    ])
  ],
  providers: [MessageService,ConfirmationService,DialogService]
})
export class ProductComponent implements OnInit {

  productDialog!: boolean;

  infoDialog!: boolean;

  supplierDialog!: boolean;

  productExtraCostDialog!: boolean;

  productSupplierDialog!: boolean;

  detailsDialog!: boolean;

  imageDialog!: boolean;

  products!: Product[];

  pi!: ProductImage[];

  suppliers!: Supplier[];

  details!: Detail[];

  detail!: Detail;
  params!: Params;
  productSupplier!: ProductSupplier;

  categories!: Category[];

  supplier!:Supplier;



  product!: Product;

  productExtraCost!: ProductExtraCost;

  information!: Information;

  selectedProducts!: Product[];

  submitted!: boolean;

  price!: number;

  ref!: DynamicDialogRef;

  cols!: any[];

  exportColumns!: any[];

  value: number=0;
  uploadedFiles: any[] = [];





  constructor(private productService: ProductService,private categoryService: CategoryService, private supplierService: SupplierService,private orderService: OrderSupplierService,private messageService: MessageService, private confirmationService: ConfirmationService,public dialogService: DialogService,) { }

  ngOnInit() {
    this.details=[];

    this.productService.getProduct().subscribe(data => {
      this.products = data;
      this.products.forEach((product : Product, val: number)=>{
        this.productService.getPrice(product.id).subscribe( data =>{
            val=data;
            product.price = val;

          }
          , error => console.log(error));
      })
      this.details=[];

    });
    this.categoryService.getALLSubCategory().subscribe(data => {
      this.categories = data;

    });
    this.supplierService.getSuppliers().subscribe(data => {
      this.suppliers = data;

    });
    this.cols = [
      { field: 'name', header: 'Name' },
      { field: 'price', header: 'Price' },
      { field: 'code', header: 'Code' },
      { field: 'brand', header: 'brand' },
    ];

    this.exportColumns = this.cols.map(col => ({title: col.header, dataKey: col.field}));

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
  showSupplier(product: Product) {
    this.product = {...product};
    this.supplierDialog = true;
  }

  deleteProduct(product: Product) {

        this.productService.DeleteProduct(product.id).subscribe(
          data=>{
            console.log(data);

          }
        )
        this.products = this.products.filter(val => val.id !== product.id);
        this.product = new Product();
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Deleted', life: 3000});
      }

  hideDialog() {
    this.productDialog = false;
    this.submitted = false;
  }
  hideInfoDialog() {
    this.infoDialog = false;
    this.submitted = false;
  }
  hideExtraDialog() {
    this.productExtraCostDialog = false;
    this.submitted = false;
  }
  hideDetailDialog() {
    this.detailsDialog = false;
    this.submitted = false;
  }
  hidePSDialog() {
    this.productSupplierDialog = false;
    this.submitted = false;
  }
  showInfoDialog() {
    this.productDialog = false;
    this.infoDialog=true;
    this.information=new Information();
  }
  showproductExtraCostDialog() {
    this.infoDialog = false;
    this.productExtraCostDialog=true;
    this.productExtraCost=new ProductExtraCost();
  }
  showdetailsDialog() {
    this.productExtraCostDialog = false;
    this.detailsDialog=true;
    this.detail=new Detail();
  }
  addDetailsForm() {
    this.details.push(this.detail);
    this.detail=new Detail();

  }
  removeDetailsForm() {
    this.details.splice(-1, 1);
  }
  showPs() {
    this.detailsDialog = false;
    this.productSupplierDialog=true;
    this.productSupplier=new ProductSupplier();
  }
  saveProduct() {
    this.submitted = true;

    if (this.product.name.trim()) {
      if (this.product.id) {
        this.products[this.findIndexById(this.product.id)] = this.product;
        this.product.productExtraCost=this.productExtraCost;
        this.product.details=this.details;
        this.product.information=this.information;
        this.product.suppliers.push(this.supplier)
        this.params=new Params();
        this.params.product=this.product;
        this.productService.createProduct(this.params).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Updated', life: 3000});
      }
      else {
        this.product.productExtraCost=this.productExtraCost;
        this.product.details=this.details;
        this.product.information=this.information;
        this.params=new Params();
        this.params.product=this.product;
        this.params.supplier=this.supplier;
        this.params.productSupplier=this.productSupplier;
        console.log(this.params);
        this.productService.createProduct(this.params).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.products.push(this.product);
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Product Created', life: 3000});
        this.productSupplierDialog = false;
        this.imageDialog = false;
        this.infoDialog = false;
        this.productDialog = false;
      }

      this.products = [...this.products];

      this.product = new Product();
    }
    this.reloadPage();
  }
  reloadPage(): void {
    window.location.reload();
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

  show(product:Product) {

    this.ref = this.dialogService.open(DetailComponent, {
      header: 'Product Details',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {details: product.details}


    });

    this.ref.onClose.subscribe((details: Detail) =>{

    });
  }
  showInfo(product:Product) {
    this.ref = this.dialogService.open(InformationComponent, {
      header: 'Product Information',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {info: product.information}

    });

    this.ref.onClose.subscribe((information: Information) =>{

    });
  }
  showMvt(product:Product) {
    this.ref = this.dialogService.open(MouvementComponent, {
      header: 'Product Mouvement',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {mvt: product.mouvements}

    });

    this.ref.onClose.subscribe((mouvement: Mouvement) =>{

    });
  }
  showExtraCost(product:Product) {
    this.ref = this.dialogService.open(ProductExtraCostComponent, {
      header: 'Product Extra Cost',
      width: '70%',
      contentStyle: {"max-height": "500px", "overflow": "auto"},
      baseZIndex: 10000,
      data: {extracost: product.productExtraCost}

    });

    this.ref.onClose.subscribe((mouvement: Mouvement) =>{

    });
  }

  ngOnDestroy() {
    if (this.ref) {
      this.ref.close();
    }
  }
  exportPdf() {
    const doc = new jsPDF.default('l', 'pt');
    doc.autoTable(this.exportColumns, this.products);
    doc.save('products.pdf');
  }

  exportExcel() {
    import("xlsx").then(xlsx => {
      const worksheet = xlsx.utils.json_to_sheet(this.products);
      const workbook = { Sheets: { 'data': worksheet }, SheetNames: ['data'] };
      const excelBuffer: any = xlsx.write(workbook, { bookType: 'xlsx', type: 'array' });
      this.saveAsExcelFile(excelBuffer, "products");
    });
  }

  saveAsExcelFile(buffer: any, fileName: string): void {
    let EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
    let EXCEL_EXTENSION = '.xlsx';
    const data: Blob = new Blob([buffer], {
      type: EXCEL_TYPE
    });
    FileSaver.saveAs(data, fileName + '_export_' + new Date().getTime() + EXCEL_EXTENSION);
  }
    orderSelectedProducts() {

        // this.products = this.products.filter(val => !this.selectedProducts.includes(val));
        this.orderService.createOrder(this.selectedProducts).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.selectedProducts = [];

        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Products Ordered', life: 3000});
      }

  onUpload(event: { files: any; },product:Product) {
    for(let file of event.files) {
      this.productService.updatePic(product.id,file)
      this.uploadedFiles.push(file);
    }

    this.messageService.add({severity: 'info', summary: 'File Uploaded', detail: ''});
  }
}
