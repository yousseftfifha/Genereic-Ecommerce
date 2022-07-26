import {Information} from "../Information/information";
import {Detail} from "../Detail/detail";
import {Mouvement} from "../Mouvement/mouvement";
import {Supplier} from "../Suppliers/supplier";
import {ProductImage} from "../ProductImage/product-image";
import {ProductExtraCost} from "../ProductExtraCost/product-extra-cost";
import {Category} from "../Category/category";
import {Product} from "./product";
import {ProductSupplier} from "../ProductSupplier/product-supplier";

export class Params {
  product!:Product;
  supplier!:Supplier;
  productSupplier!:ProductSupplier;
}
