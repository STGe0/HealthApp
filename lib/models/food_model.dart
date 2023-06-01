import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel{
  String? id;
  final dynamic name_product;
  final dynamic weight_product;
  final dynamic protein;
  final dynamic carb;
  final dynamic fats;
  final dynamic calorie;

  FoodModel({
    this.id,
    required this.name_product,
    required this.weight_product,
    required this.protein,
    required this.carb,
    required this.fats,
    required this.calorie,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "name_product": name_product,
    "weight_product": weight_product,
    "protein": protein,
    "carb": carb,
    "fats": fats,
    "calorie": calorie,
  };

  factory FoodModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return FoodModel(
      id: document.id,
      name_product: data["name_product"],
      weight_product: data["weight_product"],
      protein: data["protein"],
      carb: data["carb"],
      fats: data["fats"],
      calorie: data["calorie"],
    );
  }
}