import { Component, OnInit } from '@angular/core';
import {LoginService} from "../../Entities/Login/login.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  private roles!: string[];
  isLoggedIn = false;
  showAdminBoard = false;
  username!: string;

  constructor(private authService: LoginService,private router:Router) { }



  ngOnInit(): void {
    this.isLoggedIn = !!this.authService.getToken();

    if (this.isLoggedIn) {
      const user = this.authService.getUser();
      this.roles = user.roles;

      this.showAdminBoard = this.roles.includes('ROLE_ADMIN');

      this.username = user.username;
    }
  }

}
