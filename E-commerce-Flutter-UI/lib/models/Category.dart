import 'dart:convert';

Category UserModelJson(String str) => Category.fromJson(json.decode(str));

String CategoryModelToJson(Category data) => json.encode(data.toJson());

class Category {
  int id;
  String name;
  String description;


  Category(
      {this.id,
        this.name,
        this.description,
        });

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
  );

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    "name": name,
    "description": description
  };


  int get ID => id;

  String get namee =>name;

  String get desc =>description;

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}

