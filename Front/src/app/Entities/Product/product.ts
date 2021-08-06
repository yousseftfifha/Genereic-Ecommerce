import {Information} from "../Information/information";
import {Detail} from "../Detail/detail";
import {Mouvement} from "../Mouvement/mouvement";
import {Supplier} from "../Suppliers/supplier";
import {ProductImage} from "../ProductImage/product-image";
import {ProductExtraCost} from "../ProductExtraCost/product-extra-cost";
import {Category} from "../Category/category";

export class Product {
  id!:               number;//DISPLAYED
  tmpCode!:          string;
  code!:             string;//DISPLAYED
  name!:             string;//DISPLAYED
  brand!:            string;//DISPLAYED
  description!:      string;
  sku!:              number;
  isbn!:             number;
  createdDate!:      Date;
  cancelledDate!:    Date;
  cancelledReason!:  string;
  category!:         Category;//DISPLAYED
  information!:      Information;//DISPLAYED
  productExtraCost!: ProductExtraCost;
  mouvements!:       Mouvement[];//DISPLAYED
  productImages!:    ProductImage[];//DISPLAYED ONE
  details!:          Detail[];//DISPLAYED
  suppliers!:        Supplier[];//DISPLAYED
  price!:            number;//DISPLAYED
}
