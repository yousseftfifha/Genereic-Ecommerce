import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "../Suppliers/supplier";
import {OrderCustomer} from "./OrderCustomer";
import {Product} from "../Product/product";

@Injectable({
  providedIn: 'root'
})
export class OrderCustomerService {

  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getOrders():Observable<OrderCustomer[]>{
    return this.http.get<OrderCustomer[]>(this.host+"/order");
  }
  public ConfirmOrder(id: number,order:OrderCustomer): Observable<Object>{
    return this.http.put(this.host+"/order"+'/'+id+"/CONFIRMED",order);
  }
  public CancelOrder(id: number,order:OrderCustomer): Observable<Object>{
    return this.http.put(this.host+"/order"+'/'+id+"/CANCELLED",order);
  }
  public countAll():Observable<number>{
    return this.http.get<number>(this.host+"/order/count");
  }
  public countMVT():Observable<number>{
    return this.http.get<number>(this.host+"/order/count1");
  }
  public countMVTIN():Observable<number>{
    return this.http.get<number>(this.host+"/order/count2");
  } public countMVTOUT():Observable<number>{
    return this.http.get<number>(this.host+"/order/count3");
  }
  public earning():Observable<number>{
    return this.http.get<number>(this.host+"/order/earning");
  }

}
