import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_coffee_shop/pages/cart_page.dart';
import 'package:demo_coffee_shop/widgets/category_item.dart';
import 'package:flutter/material.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://nguyenlieuphache.com/wp-content/uploads/2015/11/2.jpg',
  'https://cdn-www.vinid.net/2020/04/61d97550-tr%C3%A0-%C4%91%C3%A0o-cam-s%E1%BA%A3.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQokF9yiTGj1n20HXUYn1CoaBvO1emgbqCpAg&usqp=CAU',
];
final List<String> titles = [
  ' Cà Phê ',
  ' Đá Xay ',
  ' Trà ',
  ' Bánh ',
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coffee Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Giỏ Hàng',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      // enlargeCenterPage: true,
                      //scrollDirection: Axis.vertical,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _currentIndex = index;
                          },
                        );
                      },
                    ),
                    items: imagesList
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              elevation: 6.0,
                              shadowColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    Center(
                                      child: Text(
                                        '${titles[_currentIndex]}',
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor: Colors.black45,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagesList.map((urlOfItem) {
                      int index = imagesList.indexOf(urlOfItem);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromRGBO(0, 0, 0, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Text('categories')),
                  CategoryItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
