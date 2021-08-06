import { Component, OnInit } from '@angular/core';
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Product} from "../Product/product";
import {Information} from "./information";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-information',
  templateUrl: './information.component.html',
  styleUrls: ['./information.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class InformationComponent implements OnInit {

  info!: Information;
  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.info=new Information();
    this.info=this.config.data.info;
  }

}
