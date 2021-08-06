import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "../Suppliers/supplier";
import {Product} from "./product";

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getProduct():Observable<Product[]>{
    return this.http.get<Product[]>(this.host+"/product");
  }
}
