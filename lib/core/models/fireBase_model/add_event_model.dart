import 'package:flutter/material.dart';

class AddEventModel {
  String? eventId;
  String eventTittle;
  String eventDesc;
  DateTime selectedEventDate;
  String categoryId;

   String imagePath;
  bool isFavorite;

  AddEventModel({
     this.eventId,
    required this.eventTittle,
    required this.eventDesc,
    required this.selectedEventDate,
    required this.categoryId,

    required this.imagePath,
    this.isFavorite = false,
  });

  factory AddEventModel.fromFireStore(Map<String, dynamic> json) {
    return AddEventModel(
      eventId: json['eventId'],
      eventTittle: json['eventTittle'],
      eventDesc: json['eventDesc'],
      selectedEventDate: DateTime.fromMillisecondsSinceEpoch(json['selectedEventDate']),
      categoryId: json['categoryId'],
      imagePath: json['imagePath'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'eventId': eventId,
      'eventTittle': eventTittle,
      'eventDesc': eventDesc,
      'selectedEventDate': selectedEventDate.millisecondsSinceEpoch,
      'categoryId': categoryId,
      'imagePath': imagePath,
      'isFavorite': isFavorite,
    };
  }
}
