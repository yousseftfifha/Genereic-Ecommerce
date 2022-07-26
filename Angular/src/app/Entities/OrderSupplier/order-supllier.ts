import {OrderSupllierItem} from "../OrderSupllierItem/order-supllier-item";

export class OrderSupllier {
  id!:                 number;
  orderNumber!:        string;
  status!:             string;
  orderDate!:          Date;
  orderItemSuppliers!: OrderSupllierItem[];}
