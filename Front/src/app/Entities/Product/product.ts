import {Information} from "../Information/information";
import {Detail} from "../Detail/detail";
import {Mouvement} from "../Mouvement/mouvement";
import {Supplier} from "../Suppliers/supplier";
import {ProductImage} from "../ProductImage/product-image";
import {ProductExtraCost} from "../ProductExtraCost/product-extra-cost";
import {Category} from "../Category/category";

export class Product {
  id!:               number;
  tmpCode!:          string;
  code!:             string;
  name!:             string;
  brand!:            string;
  description!:      string;
  sku!:              number;
  isbn!:             number;
  createdDate!:      Date;
  cancelledDate!:    Date;
  cancelledReason!:  string;
  category!:         Category;
  information!:      Information;
  productExtraCost!: ProductExtraCost;
  mouvements!:       Mouvement[];
  productImages!:    ProductImage[];
  details!:          Detail[];
  suppliers!:        Supplier[];
}
