class Order {
  String? id;
  late String quantity;
  late String price;
  String? user;

  Order({this.id, required this.quantity, required this.price, this.user});
  String toString() {
    // TODO: implement toString
    return '${id} + ${quantity} + ${price} + ${user}';
  }
  static List<Order> order = [];
}
