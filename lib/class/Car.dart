import 'dart:convert';
import 'dart:typed_data';

class Car {
  String mark;
  double price;
  String model;
  String description;
  int id_admin;
  int id_car;
  Uint8List image;

  Car(this.mark, this.price, this.model, this.description, this.image,this.id_admin,this.id_car);

  Car.fromJson(Map<String, dynamic> json)
    : id_car = json['id'] as int? ?? 0,
      mark = json['mark'] as String? ?? '',
      price = (json['price'] as num?)?.toDouble() ?? 0.0,
      model = json['model'] as String? ?? '',
      description = json['description'] as String? ?? '',
      id_admin = (json['id_admin'] as int?) ?? 0,
      image = (json['image'] != null) ? base64Decode(json['image'] as String) : Uint8List(0);
}
