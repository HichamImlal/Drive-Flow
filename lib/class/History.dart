import 'dart:convert';
import 'dart:typed_data';

class History {
  final int historyId;
  final int userId;
  final String mark;
  final String model;
  final DateTime dateIn;
  final DateTime dateOut;
  final int carId;
  final double total;
  final Uint8List carImage;

  History({
    required this.historyId,
    required this.userId,
    required this.mark,
    required this.model,
    required this.dateIn,
    required this.dateOut,
    required this.carId,
    required this.total,
    required this.carImage,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      historyId: json['historyId'],
      userId: json['userId'],
      mark: json['mark'],
      model: json['model'],
      dateIn: DateTime.parse(json['dateIn']),
      dateOut: DateTime.parse(json['dateOut']),
      carId: json['carId'],
      total: json['total'].toDouble(),
      carImage: _parseCarImage(json['carImage']),
    );
  }

  static Uint8List _parseCarImage(dynamic carImageJson) {
    if (carImageJson is List<int>) {
      return Uint8List.fromList(carImageJson);
    } else if (carImageJson is String) {
      List<int> bytes = base64.decode(carImageJson);
      return Uint8List.fromList(bytes);
    } else {
      throw Exception('Invalid car image format');
    }
  }
}
