import 'package:flutter/material.dart';

class OrderItem {
  late String idProduct;
  String? idOrder;
  late String name;
  late String quantity;
  late String price;
  late String image;

  OrderItem(
      {required this.idProduct,
      this.idOrder,
      required this.name,
      required this.quantity,
      required this.price,
      required this.image});

  @override
  String toString() {
    // TODO: implement toString
    return '${idProduct} + ${idOrder} + ${quantity} + ${price}';
  }

  static List<OrderItem> order = [];

  static void addCart(String idProduct, String name, String quantity,
      String price, String image) {
    if (order.isEmpty == true) {
      order.add(OrderItem(
          idProduct: idProduct,
          name: name,
          quantity: quantity,
          price: price,
          image: image));
      print('them thanh cong   ${order}');
    } else {
      bool exits = false;
      if (order.isNotEmpty) {
        for (int i = 0; i < order.length; i++) {
          if (order[i].idProduct == idProduct) {
            order[i].quantity =
                (int.parse(order[i].quantity) + (int.parse(quantity)))
                    .toString();
            exits = true;
          }
        }
        if (exits == false) {
          order.add(OrderItem(
              idProduct: idProduct,
              name: name,
              quantity: quantity,
              price: price,
              image: image));
        }
      }
    }
  }

  static priceTotal(List<OrderItem> cart) {
    int total = 0;
    for (var price in cart) {
      total = total + ((int.parse(price.price) * int.parse(price.quantity)));
    }
    return total;
  }

  static quantityTotal(List<OrderItem> cart) {
    int total = 0;
    for (var quantity in cart) {
      total += (int.parse(quantity.quantity));
    }
    return total;
  }

  static void deteleItem(String id) {
    order.removeWhere((item) => item.idProduct == id);
  }

  static void addQuality(int index) {
    order[index].quantity = (int.parse(order[index].quantity) + 1).toString();
  }

  static void minusQuality(int index) {
    order[index].quantity = (int.parse(order[index].quantity) - 1).toString();
    if (order[index].quantity == '0') {
      order.remove(order[index]);
    }
  }
}
