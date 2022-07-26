import { Component, OnInit } from '@angular/core';
import {Product} from "../Product/product";
import {Detail} from "../Detail/detail";
import {ProductService} from "../Product/product.service";
import {DialogService, DynamicDialogConfig, DynamicDialogRef} from "primeng/dynamicdialog";
import {Mouvement} from "./mouvement";
import {ConfirmationService, MessageService} from "primeng/api";

@Component({
  selector: 'app-mouvement',
  templateUrl: './mouvement.component.html',
  styleUrls: ['./mouvement.component.css'],
  providers: [MessageService,ConfirmationService,DialogService]

})
export class MouvementComponent implements OnInit {

  mouvments!: Mouvement[];

  constructor(private productService: ProductService, public ref: DynamicDialogRef, public config: DynamicDialogConfig) { }

  ngOnInit() {
    this.mouvments= [];
    this.mouvments=this.config.data.mvt;

  }



}
