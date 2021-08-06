class AddressList {
  AddressList({
    this.id,
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.type,
  });

  int id;
  String street;
  String city;
  String state;
  String country;
  String zipcode;
  String type;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    id: json["id"],
    street: json["street"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipcode: json["zipcode"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "street": street,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "type": type,
  };
}
