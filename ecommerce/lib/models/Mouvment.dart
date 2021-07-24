class Mouvement {
  Mouvement({
    this.id,
    this.type,
    this.quantity,
  });

  int id;
  int type;
  int quantity;

  factory Mouvement.fromJson(Map<String, dynamic> json) => Mouvement(
        id: json["id"],
        type: json["type"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "quantity": quantity,
      };
}
