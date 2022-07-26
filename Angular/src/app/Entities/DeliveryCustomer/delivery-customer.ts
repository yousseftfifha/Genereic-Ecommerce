import {DeliveryCustomerItem} from "../DeliveryCustomerItem/delivery-customer-item";

export class DeliveryCustomer {
  id!:                    number;
  deliveryCustomerItems!: DeliveryCustomerItem[];
  deliveryDate!:          Date;
  deliveryNumber!:        string;
}
