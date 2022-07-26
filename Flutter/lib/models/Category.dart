class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.url,
  });

  int id;
  String name;
  String description;
  String url;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
      };
}
