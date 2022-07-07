import 'package:demo_coffee_shop/models/order_item.dart';
import 'package:demo_coffee_shop/models/services.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Thong tin'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'name'),
                controller: _nameController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'address'),
                controller: _addressController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'phone'),
                controller: _phoneController,
              ),
            ),
            InkWell(
              onTap: () {
                Services.fetchUser(_nameController.text,
                    _addressController.text, _phoneController.text);
                Navigator.pop(context);
                Navigator.pop(context);
                OrderItem.order = [];
              },
              child: Container(
                color: Colors.brown,
                padding: const EdgeInsets.all(30),
                child: Text('Xac nhan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
