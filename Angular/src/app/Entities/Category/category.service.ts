import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Category} from "./category";
import {Supplier} from "../Suppliers/supplier";

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  public host:string = "http://localhost:8081/api";

  constructor(private http:HttpClient) { }

  public getCategory():Observable<Category[]>{
    return this.http.get<Category[]>(this.host+"/category/main");
  }
  public countCategory():Observable<number>{
    return this.http.get<number>(this.host+"/category/count");
  }
  public getSubCategory(id: number):Observable<Category[]>{
    return this.http.get<Category[]>(this.host+"/category/sub/"+id);
  } public getALLSubCategory():Observable<Category[]>{
    return this.http.get<Category[]>(this.host+"/category/sub");
  }
  public getCategoryById(id: number): Observable<Category>{
    return this.http.get<Category>(this.host+"/category"+'/'+id);
  }
  public createCategory(category:Category):Observable<Object>{
    return this.http.post(this.host+"/category",category);
  }

  public updateCategory(id: number,category:Category): Observable<Object>{
    return this.http.put(this.host+"/category"+'/'+id,category);
  }

  public DeleteCategory(id: number): Observable<Object>{
    return this.http.delete(this.host+"/category"+'/'+id);

  }

}
