import 'package:demo_coffee_shop/models/order.dart';
import 'package:demo_coffee_shop/models/order_item.dart';
import 'package:demo_coffee_shop/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Gio hang',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              OrderItem.quantityTotal(OrderItem.order).toString(),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: OrderItem.order.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                onDismissed: (directions) {
                  setState(() {
                    OrderItem.deteleItem(OrderItem.order[index].idProduct);
                  });
                },
                key: Key(OrderItem.order[index].toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [Spacer(), Icon(Icons.add)],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.9,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: ExactAssetImage(
                                    'assets/images/products/${OrderItem.order[index].image}')),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(OrderItem.order[index].name),
                        SizedBox(
                          height: 10,
                        ),
                        Text(OrderItem.order[index].price),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    OrderItem.minusQuality(index);
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                OrderItem.order[index].quantity,
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    OrderItem.addQuality(index);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Total:\n',
                  children: [
                    TextSpan(
                        text: OrderItem.priceTotal(OrderItem.order).toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black))
                  ],
                ),
              ),
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () {
                    Order.order.add(Order(
                        quantity:
                        OrderItem.quantityTotal(OrderItem.order).toString(),
                        price:
                        OrderItem.priceTotal(OrderItem.order).toString()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserPage()));
                  },
                  child: Text('Dat Hang'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
