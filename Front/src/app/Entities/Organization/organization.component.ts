import { Component, OnInit } from '@angular/core';
import {MessageService, TreeNode} from "primeng/api";
import {Router} from "@angular/router";
import {OrganizationService} from "./organization.service";
import {Organization} from "./organization";
import {OrderCustomerService} from "../OrderCustomer/order-customer.service";
import {CategoryService} from "../Category/category.service";
import {SupplierService} from "../Suppliers/supplier.service";
import {ProductService} from "../Product/product.service";

@Component({
  selector: 'app-dashboard',
  templateUrl: './organization.component.html',
  styleUrls: ['./organization.component.css'],
  styles:[":host ::ng-deep .p-organizationchart {\n" +
  "    .p-person {\n" +
  "        padding: 0;\n" +
  "        border: 0 none;\n" +
  "    }\n" +
  "\n" +
  "    .node-header, .node-content {\n" +
  "        padding: .5em .7rem;\n" +
  "    }\n" +
  "\n" +
  "    .node-header {\n" +
  "        background-color: #495ebb;\n" +
  "        color: #ffffff;\n" +
  "    }\n" +
  "\n" +
  "    .node-content {\n" +
  "        text-align: center;\n" +
  "        border: 1px solid #495ebb;\n" +
  "    }\n" +
  "\n" +
  "    .node-content img {\n" +
  "        border-radius: 50%;\n" +
  "    }\n" +
  "\n" +
  "    .department-cfo {\n" +
  "        background-color: #7247bc;\n" +
  "        color: #ffffff;\n" +
  "    }\n" +
  "\n" +
  "    .department-coo {\n" +
  "        background-color: #a534b6;\n" +
  "        color: #ffffff;\n" +
  "    }\n" +
  "\n" +
  "    .department-cto {\n" +
  "        background-color: #e9286f;\n" +
  "        color: #ffffff;\n" +
  "    }\n" +
  "}"],
  providers: [MessageService]
})
export class OrganizationComponent implements OnInit {
  dashboard!: Organization[];

  data1!: TreeNode[];

  data2!: TreeNode[];

  selectedNode!: TreeNode;

  count!:  number;

  earning!:  number;

  category!:  number;

  mvt!:  number;

  mvtIN!:  number;

  mvtOUT!:  number;

  supplier!:  number;

  product!:  number;

  constructor(private dashboardService:OrganizationService ,private orderService:OrderCustomerService,private supplierService:SupplierService,private prdouctService:ProductService,private categoryService:CategoryService, private messageService: MessageService, private router:Router) {}

  ngOnInit() {
    this.dashboardService.getOrganization().subscribe(data => this.dashboard = data);
    this.orderService.countAll().subscribe(data => this.count = data);
    this.orderService.earning().subscribe(data => this.earning = data);
    this.orderService.countMVT().subscribe(data => this.mvt = data);
    this.orderService.countMVTIN().subscribe(data => this.mvtIN = data);
    this.orderService.countMVTOUT().subscribe(data => this.mvtOUT = data);
    this.categoryService.countCategory().subscribe(data => this.category = data);
    this.supplierService.countSuppliers().subscribe(data => this.supplier = data);
    this.prdouctService.countProduct().subscribe(data => this.product = data);
    console.log(this.supplier)
    console.log(this.product)
    this.data1 = [{
      label: 'CEO',
      type: 'person',
      styleClass: 'p-person',
      expanded: true,
      data: {name:'Walter White', 'avatar': 'walter.jpg'},
      children: [
        {
          label: 'CFO',
          type: 'person',
          styleClass: 'p-person',
          expanded: true,
          data: {name:'Saul Goodman', 'avatar': 'saul.jpg'},
          children:[{
            label: 'Tax',
            styleClass: 'department-cfo'
          },
            {
              label: 'Legal',
              styleClass: 'department-cfo'
            }],
        },
        {
          label: 'COO',
          type: 'person',
          styleClass: 'p-person',
          expanded: true,
          data: {name:'Mike E.', 'avatar': 'mike.jpg'},
          children:[{
            label: 'Operations',
            styleClass: 'department-coo'
          }]
        },
        {
          label: 'CTO',
          type: 'person',
          styleClass: 'p-person',
          expanded: true,
          data: {name:'Jesse Pinkman', 'avatar': 'jesse.jpg'},
          children:[{
            label: 'Development',
            styleClass: 'department-cto',
            expanded: true,
            children:[{
              label: 'Analysis',
              styleClass: 'department-cto'
            },
              {
                label: 'Front End',
                styleClass: 'department-cto'
              },
              {
                label: 'Back End',
                styleClass: 'department-cto'
              }]
          },
            {
              label: 'QA',
              styleClass: 'department-cto'
            },
            {
              label: 'R&D',
              styleClass: 'department-cto'
            }]
        }
      ]
    }];

  }

  onNodeSelect(event: { node: { label: any; }; }) {
    this.messageService.add({severity: 'success', summary: 'Node Selected', detail: event.node.label});
  }

}
