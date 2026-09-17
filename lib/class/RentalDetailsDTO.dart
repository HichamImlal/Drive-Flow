class RentalDetailsDTO {
  final String image;
  final double totalPrice;
  final String mark;
  final String model;
  final String email;
  final String dateIn;
  final String dateOut;

  RentalDetailsDTO({
    required this.image,
    required this.totalPrice,
    required this.mark,
    required this.model,
    required this.email,
    required this.dateIn,
    required this.dateOut,
  });

  factory RentalDetailsDTO.fromJson(Map<String, dynamic> json) {
    return RentalDetailsDTO(
      image: json['image'],
      totalPrice: json['totalPrice'],
      mark: json['mark'],
      model: json['model'],
      email: json['email'],
      dateIn: json['dateIn'],
      dateOut: json['dateOut'],
    );
  }
}
