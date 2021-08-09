import {OrderCustomerItem} from "../OrderCustomerItem/order-customer-item";

export class DeliveryCustomerItem {
  id!:                number;
  itemSeq!:           number;
  quantityAccepted!:  number;
  quantityShipped!:   number;
  note!:              string;
  orderCustomerItem!: OrderCustomerItem;
}
