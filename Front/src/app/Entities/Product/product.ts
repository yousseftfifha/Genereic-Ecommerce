import {Information} from "../Information/information";
import {Detail} from "../Detail/detail";
import {Mouvement} from "../Mouvement/mouvement";
import {Supplier} from "../Suppliers/supplier";
import {ProductImage} from "../ProductImage/product-image";
import {ProductExtraCost} from "../ProductExtraCost/product-extra-cost";
import {Category} from "../Category/category";

export class Product {
  id!:               number;//DISPLAYED //ADDED
  tmpCode!:          string; //ADDED
  code!:             string;//DISPLAYED  //ADDED
  name!:             string;//DISPLAYED //ADDED
  brand!:            string;//DISPLAYED //ADDED
  description!:      string; //ADDED
  sku!:              number; //ADDED
  isbn!:             number; //ADDED
  createdDate!:      Date; //ADDED
  cancelledDate!:    Date;
  cancelledReason!:  string;
  category!:         Category;//DISPLAYED  //ADDED
  information!:      Information;//DISPLAYED //ADDED
  productExtraCost!: ProductExtraCost; //ADDED
  mouvements!:       Mouvement[];//DISPLAYED //ADDED AUTOMATICALLY
  productImages!:    ProductImage[];//DISPLAYED ONE
  details!:          Detail[];//DISPLAYED //ADDED
  suppliers!:        Supplier[];//DISPLAYED //ADDED
  price!:            number;//DISPLAYED
}
