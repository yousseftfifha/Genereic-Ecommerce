import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "./supplier";

@Injectable({
  providedIn: 'root'
})
export class SupplierService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getSuppliers():Observable<Supplier[]>{
    return this.http.get<Supplier[]>(this.host+"/supplier");
  }
}
