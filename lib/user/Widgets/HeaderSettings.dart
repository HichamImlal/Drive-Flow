import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HeaderSettings extends StatelessWidget {
  const HeaderSettings({
    super.key,
    required this.width,
    this.text,
    this.padding,
    this.idCar,
  });

  final double width;
  final text;
  final padding;
  final idCar;

  @override
  Widget build(BuildContext context) {
    Future<void> removeCarById(int id) async {
      final url = Uri.parse('http://${ipAddress}:8080/removeCar/$id');
      var response = await http.delete(url);

      if (response.statusCode == 204) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Car removed successfully.'),
          duration: Duration(seconds: 3),
        ));
        print('Car removed successfully');
        Navigator.pushNamed(context, 'HomeScreenAdmin');
      } else if (response.statusCode == 404) {
        print('Car not found');
      } else {
        print('Failed to remove car');
      }
    }

    void _showLogoutDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Supprimer"),
              content: const Text('Voulez-vous supprimer cette voiture ?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    removeCarById(idCar);
                  },
                  child: const Text('Yes'),
                )
              ],
            );
          });
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(
              image: const AssetImage("assets/images/arrow.png"),
              width: width * 0.06,
            ),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 25, fontFamily: "Poppins_med"),
          ),
          text == "Modifier la voiture"
              ? IconButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 35,
                  ))
              : Visibility(visible: false, child: Icon(Icons.abc)),
        ],
      ),
    );
  }
}
