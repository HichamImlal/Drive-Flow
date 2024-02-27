import 'package:drive_flow_ui/screens/EditProfilScreen.dart';
import 'package:flutter/material.dart';

class CustomSettings extends StatefulWidget {
  const CustomSettings({super.key, required this.icon, this.text});
  final IconData icon;
  final text;

  @override
  State<CustomSettings> createState() => _CustomSettingsState();
}

class _CustomSettingsState extends State<CustomSettings> {
  @override
  Widget build(BuildContext context) {
    void clicked() {
       Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EditProfilScreen(),));
    }
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: widget.text == "Edit profile" ? clicked:null,
        child: Container(
          color: Colors.grey[200],
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 30,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.06,
              ),
              Text(
                widget.text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
