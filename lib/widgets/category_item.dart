import 'package:demo_coffee_shop/models/category.dart';
import 'package:demo_coffee_shop/models/services.dart';
import 'package:demo_coffee_shop/pages/product_page.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.fetchCategory().then((value) {
      setState(() {
        Category.categories = value;
        print('ABC ${Category.categories.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Category.categories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 86,
                      height: 86,
                      child: FloatingActionButton(
                        shape: const CircleBorder(),
                        heroTag: null,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      category: Category.categories[index],
                                    )),
                          );
                        },
                        backgroundColor: Colors.white,
                        child: Image.asset(
                            'assets/images/categories/${Category.categories[index].image}',
                            height: 60),
                        // child:  Icon(Icons.add,
                        //     size: 35, color: Colors.black87),
                      )),
                  Text('${Category.categories[index].name}' + ' ›')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
