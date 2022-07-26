import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Supplier} from "../Suppliers/supplier";

@Injectable({
  providedIn: 'root'
})
export class OrganizationService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }
  public getOrganization():Observable<Supplier[]>{
    return this.http.get<Supplier[]>(this.host+"/organization");
  }
}
