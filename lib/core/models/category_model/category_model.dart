import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData iconPath;
  final String imagePath;
  // final String darkImagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.imagePath,
    // required this.darkImagePath,
  });
}
