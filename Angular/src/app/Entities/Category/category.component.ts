import { Component, OnInit } from '@angular/core';
import {Product} from "../Product/product";
import {DialogService, DynamicDialogRef} from "primeng/dynamicdialog";
import {ProductService} from "../Product/product.service";
import {ConfirmationService, MessageService} from "primeng/api";
import {Category} from "./category";
import {CategoryService} from "./category.service";

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css'],
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
export class CategoryComponent implements OnInit {

  catDialog!: boolean;

  subcatDialog!: boolean;

  categories!: Category[];

  subcategories!: Category[];

  category!: Category;

  selectedCategory!: Category[];

  submitted!: boolean;

  uploadedFiles: any[] = [];

  categoryNames: string[]=[];



  constructor(private categoryService: CategoryService, private messageService: MessageService, private confirmationService: ConfirmationService) { }

  ngOnInit() {
    this.categoryService.getCategory().subscribe(data => {
      this.categories = data;

    });

  }

  openNew() {
    this.category = new Category();
    this.submitted = false;
    this.catDialog = true;
  }

  deleteSelectedCategories() {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete the selected Categories?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.categories = this.categories.filter(val => !this.selectedCategory.includes(val));
        this.selectedCategory = [];
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Categories Deleted', life: 3000});
      }
    });
  }
  ShowSubCategories(cat: Category) {
    this.categoryService.getSubCategory(cat.id).subscribe( data =>{
        this.subcategories = data;
        console.log(data);
      }
      , error => console.log(error));
    this.subcatDialog = true;
  }

  editCategories(cat: Category) {
    this.categoryService.updateCategory(cat.id,cat).subscribe( data =>{
        console.log(data);
      }
      , error => console.log(error));
    this.category = {...cat};
    this.catDialog = true;
  }

  deleteCategories(cat: Category) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + cat.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {

        this.categoryService.DeleteCategory(cat.id).subscribe(
          data=>{
            console.log(data);

          }
        )
        this.categories = this.categories.filter(val => val.id !== cat.id);
        this.category = new Category();
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Category Deleted', life: 3000});
      }
    });
  }

  hideDialog() {
    this.catDialog = false;
    this.submitted = false;
  }

  saveCategories() {
    this.submitted = true;

    if (this.category.name.trim()) {
      if (this.category.id) {
        this.categories[this.findIndexById(this.category.id)] = this.category;
        this.categoryService.createCategory(this.category).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Category Updated', life: 3000});
      }
      else {
        this.categoryService.createCategory(this.category).subscribe( data =>{
            console.log(data);
          }
          , error => console.log(error));
        this.categories.push(this.category);
        this.messageService.add({severity:'success', summary: 'Successful', detail: 'Category Created', life: 3000});
      }

      this.categories = [...this.categories];
      this.catDialog = false;
      this.category = new Category();
    }
  }

  findIndexById(id: number): number {
    let index = -1;
    for (let i = 0; i < this.categories.length; i++) {
      if (this.categories[i].id === id) {
        index = i;
        break;
      }
    }

    return index;
  }


  onUpload(event: { files: any; }) {
    for(let file of event.files) {
      this.uploadedFiles.push(file);
    }

    this.messageService.add({severity: 'info', summary: 'File Uploaded', detail: ''});
  }
}
