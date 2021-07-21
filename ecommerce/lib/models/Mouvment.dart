import 'dart:convert';

Mouvement MouvementModelJson(String str) => Mouvement.fromJson(json.decode(str));

String MouvementModelToJson(Mouvement data) => json.encode(data.toJson());

class Mouvement {
  int id;
  int quantity;
  int ins;
  int outs;
  int transfered;
  double unit_price;

  Mouvement(
      {this.id,
        this.quantity,
        this.ins,
        this.outs,
        this.transfered,
        this.unit_price});

  factory Mouvement.fromJson(Map<dynamic, dynamic> json) => Mouvement(
      id: json["id"],
      quantity: json["quantity"],
      ins: json["ins"],
      outs: json["outs"],
      transfered: json["transfered"],
      unit_price: json["unit_price"]);

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    "quantity": quantity,
    "ins": ins,
    "outs": outs,
    "transfered": transfered,
    "unit_price":unit_price
  };

}

