import 'dart:convert';

Category UserModelJson(String str) => Category.fromJson(json.decode(str));

String CategoryModelToJson(Category data) => json.encode(data.toJson());

class Category {
  int id;
  String name;
  String description;
  String url;


  Category(
      {this.id,
        this.name,
        this.description,
        this.url
        });

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"]
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    "name": name,
    "description": description,
    "url":url
  };


  int get ID => id;

  String get namee =>name;

  String get desc =>description;

  String get u =>url;
  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description, url: $url}';
  }
}

