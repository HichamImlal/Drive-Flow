import 'package:drive_flow_ui/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/Widgets/CustomInput.dart';
import 'package:drive_flow_ui/Widgets/TitleInput.dart';
import 'package:flutter/material.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.035,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: const AssetImage("assets/images/arrow.png"),
                    width: width * 0.06,
                  ),
                ),
                SizedBox(
                  width: width * 0.25,
                ),
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: height*0.25,
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: width * 0.35,
                      width: width * 0.35,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/person1.jpg"),
                      ),
                    ),
                    Positioned(
                      right: width*0.03,
                      bottom: 0,
                        child: Image(
                      image: const  AssetImage("assets/images/circle.png"),
                      width: width * 0.08,
                    ))
                  ],
                ),
              ),
            ),
            TitleInput(width: width,text: "Username",),
            SizedBox(height: height*0.003,),
            CustomInput(hint: "username"),
            SizedBox(height: height*0.012,),
            TitleInput(width: width,text: "email",),
            SizedBox(height: height*0.003,),
            CustomInput(hint: "email"),
            SizedBox(height: height*0.012,),
            TitleInput(width: width,text: "Password",),
            SizedBox(height: height*0.003,),
            CustomInput(hint: "Password"),
            SizedBox(height: height*0.012,),
            TitleInput(width: width,text: "Confirm Password",),
            SizedBox(height: height*0.003,),
            CustomInput(hint: "Confirm Password"),
            SizedBox(height: height*0.06,),
            Center(child: ButtonCustom(text: "Save",clicked: (){},)),
          ],
        ),
      ),
    );
  }
}


