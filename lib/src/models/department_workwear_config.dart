class DepartmentWorkwearConfig {
  /// Custom price for this workwear in this department.
  /// If null, the domain-level price is used.
  double? price;

  /// Whether customization notes are required when ordering this workwear.
  /// Defaults to false if not specified.
  bool notesRequired;

  DepartmentWorkwearConfig({
    this.price,
    this.notesRequired = false,
  });

  DepartmentWorkwearConfig.fromJson(Map<String, dynamic> json)
      : price = json["price"]?.toDouble(),
        notesRequired = json["notesRequired"] ?? false;

  Map<String, dynamic> toJson() => {
        "price": price,
        "notesRequired": notesRequired,
      };

  DepartmentWorkwearConfig copyWith({
    double? price,
    bool? notesRequired,
  }) {
    return DepartmentWorkwearConfig(
      price: price ?? this.price,
      notesRequired: notesRequired ?? this.notesRequired,
    );
  }

  @override
  String toString() => 'DepartmentWorkwearConfig(price: $price, notesRequired: $notesRequired)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentWorkwearConfig &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          notesRequired == other.notesRequired;

  @override
  int get hashCode => price.hashCode ^ notesRequired.hashCode;
}
