import 'dart:io';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/Widgets/InputButtomSheet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddPostAdmin extends StatefulWidget {
  const AddPostAdmin({super.key});

  @override
  State<AddPostAdmin> createState() => _AddPostAdminState();
}

class _AddPostAdminState extends State<AddPostAdmin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mark = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _model = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void dispose() {
    _mark.dispose();
    _price.dispose();
    _model.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _mark = TextEditingController();
    _price = TextEditingController();
    _model = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  bool _isLoading = false;
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }
Future<void> _addPost() async {
    final url = Uri.parse('http://${ipAddress}:8080/addPost');
    var request = http.MultipartRequest('POST', url);
    request.fields['mark'] = _mark.text;
    request.fields['price'] = _price.text;
    request.fields['model'] = _model.text;
    request.fields['description'] = _description.text;
    if (_imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));
    } else {
      print("image is null");
    }
    var response = await request.send();
    if (response.statusCode == 201) {
      print('Post saved successfully');
    } else {
      print('Failed to save post');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.037),
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    HeaderSettings(
                      padding: 0.0,
                      width: width,
                      text: "Add Post",
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                          height: height * 0.25,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                          ),
                          child: _imageFile == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: const AssetImage(
                                          "assets/images/addpic.png"),
                                      width: width * 0.15,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    const Text("Add image to your car!"),
                                  ],
                                )
                              : Image(
                                  image: FileImage(_imageFile!),
                                  fit: BoxFit.cover,
                                )),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: InputButtomSheet(
                              hint: "Mark",
                              controller: _mark,
                              validator: (value) {
                                if (value!.length < 2) {
                                  return "Insert Mark ?";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: InputButtomSheet(
                              hint: "Price",
                              controller: _price,
                              validator: (value) {
                                if (value!.length < 2) {
                                  return "Insert Price ?";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InputButtomSheet(
                      hint: "Model",
                      controller: _model,
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Insert Model ?";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InputButtomSheet(
                      hint: "Description",
                      controller: _description,
                      maxLine: 4,
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Insert  Description?";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                _isLoading
                    ? Padding(
                      padding:  EdgeInsets.only(bottom: height*0.01),
                      child: CircularProgressIndicator(
                          color: MainColor,
                        ),
                    )
                    : Padding(
                      padding:  EdgeInsets.only(bottom: height*0.01),
                      child: ButtonCustom(
                          clicked: () {
                            if (_formKey.currentState!.validate()) {
                              _addPost();
                            }
                          },
                          text: "Post",
                          isPost: false,
                        ),
                    )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
