import 'dart:convert';
import 'package:demo_coffee_shop/models/product.dart';
import 'package:demo_coffee_shop/models/order.dart';
import 'package:demo_coffee_shop/models/order_item.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

class Services {
  static const localhost = '192.168.1.10';
  static const getCategory = 'http://${localhost}/CoffeeShop/get_category.php';
  static const getProduct = 'http://${localhost}/CoffeeShop/get_product.php';
  static const postOrder = 'http://${localhost}/CoffeeShop/order.php';
  static const postOrderItem = 'http://${localhost}/CoffeeShop/order_item.php';
  static const postUser = 'http://${localhost}/CoffeeShop/user.php';

  static List<Category> parseCategory(String response) {
    var list = json.decode(response) as List<dynamic>;
    List<Category> category =
    list.map((json) => Category.fromJson(json)).toList();
    return category;
  }

  static Future<List<Category>> fetchCategory() async {
    final response = await http.get(Uri.parse(getCategory));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseCategory(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }

  static Future<List<Product>> fetchProduct(String id) async {
    var map = <String, dynamic>{};
    map['id_category'] = id;
    final response = await http.post(Uri.parse(getProduct), body: map);
    if (response.statusCode == 200) {
      List<Product> list = parseProduct(response.body);
      return list;
    } else {
      throw Exception('Failed to load product');
    }
  }

  static List<Product> parseProduct(String response) {
    final list = jsonDecode(response) as List<dynamic>;
    return list.map((json) => Product.fromJson(json)).toList();
  }

  static Future<String> fetchUser(
      String name, String address, String phone) async {
    try {
      var mapUser = Map<String, dynamic>();
      mapUser['name'] = name;
      mapUser['address'] = address;
      mapUser['phone'] = phone;
      final responseUser = await http.post(Uri.parse(postUser), body: mapUser);
      if (200 == responseUser.statusCode) {
        try {
          var mapOrder = Map<String, dynamic>();
          mapOrder['id_user'] = responseUser.body.toString();
          mapOrder['quantity'] = Order.order[0].quantity.toString();
          mapOrder['price'] = Order.order[0].price.toString();
          final responseOrder =
              await http.post(Uri.parse(postOrder), body: mapOrder);
          if (responseOrder.statusCode == 200) {
            var mapItem = Map<String, dynamic>();
            for (int i = 0; i < OrderItem.order.length; i++) {
              mapItem['id_order'] = responseOrder.body.toString();
              mapItem['id_product'] = OrderItem.order[i].idProduct.toString();
              mapItem['quantity'] = OrderItem.order[i].quantity.toString();
              mapItem['price'] = OrderItem.order[i].price.toString();
              await http.post(Uri.parse(postOrderItem), body: mapItem);
            }
            return responseOrder.body;
          } else {
            throw Exception('Failed to load product');
          }
        } catch (e) {
          throw Exception('Failed to load product');
        }
      } else {
        print('loi');
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}