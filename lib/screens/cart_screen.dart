import 'package:flutter/material.dart';
import '../widget/top_navbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
