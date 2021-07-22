import 'Product.dart';

class OrderItem {
  OrderItem({
    this.id,
    this.quantity,
    this.createdDate,
    this.product,
  });

  int id;
  int quantity;
  DateTime createdDate;
  Product product;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        quantity: json["quantity"],
        createdDate: DateTime.parse(json["createdDate"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdDate":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "product": product.toJson(),
      };
}
