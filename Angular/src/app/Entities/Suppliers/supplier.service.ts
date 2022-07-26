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
  public countSuppliers():Observable<number>{
    return this.http.get<number>(this.host+"/supplier/count");
  }
  public getSupplierById(id: number): Observable<Supplier>{
    return this.http.get<Supplier>(this.host+"/supplier"+'/'+id);
  }
  public createSupplier(supplier:Supplier):Observable<Object>{
    return this.http.post(this.host+"/supplier",supplier);
  }


  public updateSupplier(id: number,supplier:Supplier): Observable<Object>{
    return this.http.put(this.host+"/supplier"+'/'+id,supplier);
  }
  public DeleteSupplier(id: number): Observable<Object>{
    return this.http.delete(this.host+"/supplier"+'/'+id);

  }
}
