class Mouvement {
  Mouvement({
    this.id,
    this.ins,
    this.outs,
    this.transfered,
    this.unitPrice,
    this.quantity,
  });

  int id;
  int ins;
  int outs;
  int transfered;
  double unitPrice;
  int quantity;

  factory Mouvement.fromJson(Map<String, dynamic> json) => Mouvement(
        id: json["id"],
        ins: json["ins"],
        outs: json["outs"],
        transfered: json["transfered"],
        unitPrice: json["unit_price"].toDouble(),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ins": ins,
        "outs": outs,
        "transfered": transfered,
        "unit_price": unitPrice,
        "quantity": quantity,
      };
}
