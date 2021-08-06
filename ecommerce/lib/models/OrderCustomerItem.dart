import 'Product.dart';

class OrderCustomerItem {
  OrderCustomerItem({
    this.id,
    this.itemSeq,
    this.quantity,
    this.unitPrice,
    this.vatCode,
    this.discountCode,
    this.createdDate,
    this.product,
  });

  int id;
  int itemSeq;
  int quantity;
  double unitPrice;
  double vatCode;
  double discountCode;
  DateTime createdDate;
  Product product;

  factory OrderCustomerItem.fromJson(Map<String, dynamic> json) => OrderCustomerItem(
    id: json["id"],
    itemSeq: json["itemSeq"],
    quantity: json["quantity"],
    unitPrice: json["unitPrice"],
    vatCode: json["vatCode"],
    discountCode: json["discountCode"],
    createdDate: DateTime.parse(json["createdDate"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "itemSeq": itemSeq,
    "quantity": quantity,
    "unitPrice": unitPrice,
    "vatCode": vatCode,
    "discountCode": discountCode,
    "createdDate": createdDate.toIso8601String(),
    "product": product.toJson(),
  };
}
