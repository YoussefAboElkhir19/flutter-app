class MobilePhone {
  final String brand;
  final String model;
  final int? storage;
  final double price;
  final String serialNumber;

  MobilePhone({
    required this.brand,
    required this.model,
    this.storage,
    this.price = 0.0,
    required this.serialNumber,
  });

  MobilePhone.withDefaultStorage({
    required this.brand,
    required this.model,
    int? storage,
    this.price = 0.0,
    required this.serialNumber,
  }) : storage = storage ?? 64;

  const MobilePhone.constant({
    required this.brand,
    required this.model,
    required this.storage,
    required this.price,
    required this.serialNumber,
  });

  @override
  String toString() {
    return '''
       Mobile Phone Details:
    - Brand: $brand
    - Model: $model
    - Storage: ${storage ?? "Unknown"} GB
    - Price: \$${price.toStringAsFixed(2)}
    - Serial Number: $serialNumber
    ''';
  }

  MobilePhone copyWith({
    String? brand,
    String? model,
    int? storage,
    double? price,
    String? serialNumber,
  }) {
    return MobilePhone(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      storage: storage ?? this.storage,
      price: price ?? this.price,
      serialNumber: serialNumber ?? this.serialNumber,
    );
  }
}

void main() {
  var phone1 = MobilePhone(
    brand: "Samsung",
    model: "Galaxy S21",
    storage: 128,
    price: 999.99,
    serialNumber: "SN12345",
  );
  print(phone1);

  var phone2 = MobilePhone.withDefaultStorage(
    brand: "Apple",
    model: "iPhone 13",
    price: 1099.99,
    serialNumber: "SN67890",
  );
  print(phone2);

  const phone3 = MobilePhone.constant(
    brand: "Google",
    model: "Pixel 6",
    storage: 256,
    price: 799.99,
    serialNumber: "SN11223",
  );
  print(phone3);

  var phone4 = phone1.copyWith(price: 899.99);
  print(phone4);
}
