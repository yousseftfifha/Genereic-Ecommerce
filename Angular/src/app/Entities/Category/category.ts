export class Category {
  id!:          number;
  name!:        string;
  description!: string;
  url!:         string;
  parentId!:    Category | null;
}
