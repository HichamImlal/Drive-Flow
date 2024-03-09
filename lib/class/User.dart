import 'dart:convert';
import 'dart:typed_data';

class User {
  final int id;
  final String username;
  final String email;
  final String password;
  final bool role;
  final Uint8List? image;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    this.image,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'role': role,
      'image': image != null ? base64Encode(image!) : null,
    };
  }
}