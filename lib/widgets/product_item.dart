import 'package:demo_coffee_shop/models/product.dart';
import 'package:demo_coffee_shop/models/services.dart';
import 'package:demo_coffee_shop/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  late String id;

  ProductItem({Key? key, required this.id}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.fetchProduct(widget.id).then((value) {
      setState(() {
        Product.products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 20,
      ),
      itemCount: Product.products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(product: Product.products[index])),
            );
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(
                      'assets/images/products/${Product.products[index].image}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20 / 4),
                  child: Text('${Product.products[index].name}'),
                ),
                Text(
                  '1000',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
