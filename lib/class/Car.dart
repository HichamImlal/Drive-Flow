
class Car {
  String mark;
  double price;
  String model;
  String description;
  // final File image;

  Car(this.mark, this.price, this.model, this.description,);

  Car.fromJson(Map<String, dynamic> json)
      : mark = json['mark'] as String,
        price = json['price'] as double,
        model = json['model'] as String,
        description = json['description']as String;
        // image = File(json['image']); 
}