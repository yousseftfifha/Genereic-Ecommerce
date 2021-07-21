class Detail {
  Detail({
    this.id,
    this.attribute,
    this.value,
  });

  int id;
  String attribute;
  String value;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        attribute: json["attribute"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attribute": attribute,
        "value": value,
      };
}
