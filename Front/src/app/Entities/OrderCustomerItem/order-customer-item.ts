import {Product} from "../Product/product";

export class OrderCustomerItem {
  id!:           number;
  itemSeq!:      number;
  quantity!:     number;
  vatCode!:      number;
  discountCode!: number;
  createdDate!:  Date;
  product!:      Product;
}
