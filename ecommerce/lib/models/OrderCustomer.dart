import 'OrderCustomerItem.dart';
import 'User.dart';

class OrderCustomer {
  OrderCustomer({
    this.id,
    this.orderNumber,
    this.status,
    this.sentMedia,
    this.urgent,
    this.createdDate,
    this.cancelledDate,
    this.orderDate,
    this.orderCustomerItems,
    this.user
  });

  int id;
  String orderNumber;
  String status;
  String sentMedia;
  String urgent;
  DateTime createdDate;
  DateTime cancelledDate;
  DateTime orderDate;
  List<OrderCustomerItem> orderCustomerItems;
  User user;

  factory OrderCustomer.fromJson(Map<String, dynamic> json) => OrderCustomer(
    id: json["id"],
    orderNumber: json["orderNumber"],
    status: json["status"],
    sentMedia: json["sentMedia"],
    urgent: json["urgent"],
    createdDate: DateTime.parse(json["createdDate"]),
    cancelledDate: json["cancelledDate"],
    orderDate: json["orderDate"],
    orderCustomerItems: List<OrderCustomerItem>.from(json["orderCustomerItems"].map((x) => OrderCustomerItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderNumber": orderNumber,
    "status": status,
    "sentMedia": sentMedia,
    "urgent": urgent,
    "createdDate": createdDate.toIso8601String(),
    "cancelledDate": cancelledDate,
    "orderDate": orderDate,
    "orderCustomerItems": List<dynamic>.from(orderCustomerItems.map((x) => x.toJson())),
  };
}
