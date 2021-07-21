class Information {
  Information({
    this.id,
    this.max,
    this.min,
    this.threshold,
    this.security,
  });

  int id;
  int max;
  int min;
  int threshold;
  int security;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["id"],
        max: json["max"],
        min: json["min"],
        threshold: json["threshold"],
        security: json["security"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "max": max,
        "min": min,
        "threshold": threshold,
        "security": security,
      };
}
