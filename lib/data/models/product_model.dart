class Product {
  final int id;
  final String name;
  final int price;
  final String image;
  final String brand;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.brand});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      brand: json['brand'],
    );
  }
}
