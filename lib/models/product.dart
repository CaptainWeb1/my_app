
import 'package:flutter/material.dart';

class Product {
  final String productName;
  final Icon icon;
  final String category;
  final double price;
  final Availability availability;
  final int weight;

  Product({this.productName,
      this.icon,
      this.category,
      this.price,
      this.availability,
      this.weight});
}

enum Availability {
  AVAILABLE,
  UNAVAILABLE
}