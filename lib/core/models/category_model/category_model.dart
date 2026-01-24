import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryModel {
  final String? id;

  final String name;

  final Widget iconPath;
  final String imagePath;


  CategoryModel({this.id, required this.name,  required this.iconPath, required this.imagePath,} );
}
