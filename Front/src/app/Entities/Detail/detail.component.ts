import { Component, OnInit } from '@angular/core';
import {Product} from "../Product/product";
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Detail} from "./detail";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class DetailComponent implements OnInit {

  details!: Detail[];


  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.details= [];
    this.details=this.config.data.details;

  }


}
