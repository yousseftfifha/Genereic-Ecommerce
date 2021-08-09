import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {OrderCustomer} from "../OrderCustomer/OrderCustomer";
import {OrderSupllier} from "./order-supllier";
import {Category} from "../Category/category";
import {Product} from "../Product/product";

@Injectable({
  providedIn: 'root'
})
export class OrderSupplierService {


  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getOrders():Observable<OrderSupllier[]>{
    return this.http.get<OrderSupllier[]>(this.host+"/ordersupplier");
  }
  public createOrder(product:Product[]):Observable<Object>{
    return this.http.post(this.host+"/ordersupplier",product);
  }
  public ConfirmOrder(id: number,order:OrderSupllier): Observable<Object>{
    return this.http.put(this.host+"/ordersupplier"+'/'+id+"/CONFIRMED",order);
  }
  public CancelOrder(id: number,order:OrderSupllier): Observable<Object>{
    return this.http.put(this.host+"/ordersupplier"+'/'+id+"/CANCELLED",order);
  }
}
