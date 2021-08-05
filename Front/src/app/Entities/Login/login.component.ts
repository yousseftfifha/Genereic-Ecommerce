import { Component, OnInit } from '@angular/core';
import {LoginService} from "./login.service";
import {User} from "./user";
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];
  user: User = new User();

  constructor(private authService: LoginService, private router:Router) { }

  ngOnInit(): void {
    if (this.authService.getToken()) {
      this.isLoggedIn = true;
      this.roles = this.authService.getUser().roles;
    }
  }

  onSubmit(): void {
    this.authService.login(this.user).subscribe(
      data => {
        this.authService.saveToken(data.accessToken);
        this.authService.saveUser(data);

        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.roles = this.authService.getUser().roles;
        this.reloadPage();
      },
      err => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
      }
    );
  }

  reloadPage(): void {
    window.location.reload();
  }
}
