import 'package:cars/pages/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarDetails extends StatelessWidget {
  Product products;
  CarDetails(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products.type),
      ),
      body: Container(
        child: Image.asset(products.image),
      ),
    );
  }
}