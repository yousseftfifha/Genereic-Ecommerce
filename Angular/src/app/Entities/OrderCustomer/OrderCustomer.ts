import {OrderCustomerItem} from "../OrderCustomerItem/order-customer-item";

export class OrderCustomer {
  id!:                 number;
  orderNumber!:        string;
  status!:             string;
  sentMedia!:          string;
  urgent!:             string;
  createdDate!:        Date;
  orderCustomerItems!: OrderCustomerItem[];
}
