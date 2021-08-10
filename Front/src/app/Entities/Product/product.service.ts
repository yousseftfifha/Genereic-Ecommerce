import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "../Suppliers/supplier";
import {Product} from "./product";
import {Category} from "../Category/category";
import {Params} from "./params";

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }

  public getProduct():Observable<Product[]>{
    return this.http.get<Product[]>(this.host+"/product");
  }
  public getPrice(id:number):Observable<number>{
    return this.http.get<number>(this.host+"/product/price/"+id);
  }
  public countProduct():Observable<number>{
    return this.http.get<number>(this.host+"/product/count");
  }


  public createProduct(product:Params):Observable<Object>{
    return this.http.post(this.host+"/product",product);
  }
  public updateProduct(id: number,product:Product): Observable<Object>{
    return this.http.put(this.host+"/product"+'/'+id,product);

  }
  public updatePic(id: number,product:File[]): Observable<Object>{
    return this.http.put(this.host+"/uploadFile/product"+'/'+id,product);
  }
  public DeleteProduct(id: number): Observable<Object>{
    return this.http.delete(this.host+"/product"+'/'+id);

  }

}
