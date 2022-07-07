class Category {
  late String id;
  late String name;
  late String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  static late List<Category> categories = [];
}
