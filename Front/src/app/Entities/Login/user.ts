export class User {
  id!:       number;
  username!: string;
  password!: string;
  email!:    string;
  employee!: Employee;
  roles!:    Role[];
}

export class Employee {
  id!:          number;
  firstName!:   string;
  lastName!:    string;
  phoneNumber!: string;
  gender!:      string;
  dateOfBirth!: Date;
}

export class Role {
  id!:   number;
  name!: string;
}
