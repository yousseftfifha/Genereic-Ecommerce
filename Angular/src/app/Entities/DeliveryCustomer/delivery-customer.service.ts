import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "../Suppliers/supplier";
import {DeliveryCustomer} from "./delivery-customer";

@Injectable({
  providedIn: 'root'
})
export class DeliveryCustomerService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getDelivery():Observable<DeliveryCustomer[]>{
    return this.http.get<DeliveryCustomer[]>(this.host+"/deliverycustomer");
  }
}
