class Product {
  late String id;
  late String name;
  late String price;
  late String image;
  late String idCategory;

  static late List<Product> products = [];

  Product(
      {required this.id,
        required this.name,
        required this.price,
        required this.image,
        required this.idCategory});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    idCategory = json['id_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['id_category'] = this.idCategory;
    return data;
  }
}
