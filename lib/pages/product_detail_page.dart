import 'package:demo_coffee_shop/models/order_item.dart';
import 'package:demo_coffee_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  Product product;

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product detail')),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 100),
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.product.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins')),
                          Text(widget.product.price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Poppins')),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantity',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins')),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(_quantity.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Poppins')),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_quantity == 1) return;
                                            _quantity -= 1;
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 180,
                            child: OutlineButton(
                              onPressed: () {
                                OrderItem.addCart(
                                    widget.product.id.toString(),
                                    widget.product.name.toString(),
                                    _quantity.toString(),
                                    widget.product.price.toString(),
                                    widget.product.image.toString());
                                print(OrderItem.order.toString());
                              },
                              child: Text('dat hang'),
                              textColor: Colors.brown,
                              highlightedBorderColor: Colors.brown[100],
                              borderSide: BorderSide(color: Colors.brown),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      height: 160,
                      child: Image.asset(
                          'assets/images/products/${widget.product.image}'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
