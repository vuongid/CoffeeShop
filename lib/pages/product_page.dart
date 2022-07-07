import 'package:demo_coffee_shop/models/category.dart';
import 'package:demo_coffee_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  Category? category;

  ProductPage({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Giỏ Hàng',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ProductItem(id: category!.id.toString()),
      ),
    );
  }
}
