import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import {User} from "./user";

const AUTH_API = 'http://localhost:8081/api/auth/';
const TOKEN_KEY = 'auth-token';
const USER_KEY = 'auth-user';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient) { }

  login(credentials: { username: string; password: string; }): Observable<any> {
    return this.http.post(AUTH_API + 'signin', {
      username: credentials.username,
      password: credentials.password
    }, httpOptions);
  }

  // register(user:Login): Observable<Object> {
  //   return this.http.post(AUTH_API + 'signup', {
  //     username: user.username,
  //     email: user.email,
  //     password: user.password
  //   }, httpOptions);
  // }
  public generateToken(request: any){
    return this.http.post("http://localhost:8081/authenticate",request,{responseType: 'text' as 'json'});
  }

  public welcome(token: string){
    let tokenStr = 'Bearer '+token;
    const headers = new HttpHeaders().set("Authorization",tokenStr);
    return this.http.get("http://localhost:8081/",{headers , responseType: 'text' as 'json'});
  }
  signOut(): void {
    window.sessionStorage.clear();
  }

  public saveToken(token: string): void {
    window.sessionStorage.removeItem(TOKEN_KEY);
    window.sessionStorage.setItem(TOKEN_KEY, token);
  }

  public getToken(): string {
    return <string>sessionStorage.getItem(TOKEN_KEY);
  }

  public saveUser(user: User): void {
    window.sessionStorage.removeItem(USER_KEY);
    window.sessionStorage.setItem(USER_KEY, JSON.stringify(user));
  }

  public getUser(): any {
    return JSON.parse(<string>sessionStorage.getItem(USER_KEY));
  }
}
