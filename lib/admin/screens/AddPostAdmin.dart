import 'dart:io';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/Widgets/InputButtomSheet.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostAdmin extends StatefulWidget {
  const AddPostAdmin(
      {super.key, this.text, this.isInEditPost = false, this.isEdit = false, this.idCar});
  final text;
  final isInEditPost;
  final isEdit;
  final idCar;
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
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
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
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    final url = Uri.parse('http://${ipAddress}:8080/addPost');
    var request = http.MultipartRequest('POST', url);
    request.fields['mark'] = _mark.text;
    request.fields['price'] = _price.text;
    request.fields['model'] = _model.text;
    request.fields['id_admin'] = userData!["id"].toString();
    request.fields['description'] = _description.text;
    request.fields['available'] = 'true';
    if (_imageFile != null) {
      if (await _imageFile!.exists()) {
        request.files
            .add(await http.MultipartFile.fromPath('image', _imageFile!.path));
      } else {
        print("Image file does not exist");
      }
    } else {
      print("Image is null");
    }
    var response = await request.send();
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Post saved successfully.'),
        duration: Duration(seconds: 3),
      ));
      print('Post saved successfully');
    } else {
      print('Failed to save post');
    }
    setState(() {
      _isLoading = false;
    });
  }
Future<void> _updatePost() async {
    setState(() {
      _isLoading = true;
    });
    final userData = Provider.of<UserDataProvider>(context, listen: false).userData;
    final url = Uri.parse('http://${ipAddress}:8080/updatePost/${widget.idCar}');
    var request = http.MultipartRequest('PUT', url);
    request.fields['mark'] = _mark.text;
    request.fields['price'] = _price.text;
    request.fields['model'] = _model.text;
    request.fields['id_admin'] = userData!["id"].toString();
    request.fields['description'] = _description.text;
    request.fields['available'] = 'true';
    if (_imageFile != null) {
      if (await _imageFile!.exists()) {
        request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));
      } else {
        print("Image file does not exist");
      }
    } else {
      print("Image is null");
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Post updated successfully.'),
        duration: Duration(seconds: 3),
      ));
      print('Post updated successfully');
    } else {
      print('Failed to update post');
    }
    setState(() {
      _isLoading = false;
    });
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
              height: widget.isInEditPost ? height * 0.9 : height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        HeaderSettings(
                          idCar: widget.idCar,
                          padding: 0.0,
                          width: width,
                          text: widget.text ?? "Ajouter une voiture",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/addImage.png"),
                                          width: width * 0.15,
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        const Text("Ajouter une image à votre voiture !"),
                                      ],
                                    )
                                  : Image(
                                      image: FileImage(_imageFile!),
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        SizedBox(
                          height: widget.isInEditPost
                              ? height * 0.03
                              : height * 0.1,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InputButtomSheet(
                                  hint: "Marque",
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
                                  hint: "Prix",
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
                          hint: "Modèle",
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
                        ),
                      ],
                    ),
                    _isLoading
                        ? Padding(
                            padding: EdgeInsets.only(bottom: height * 0.01),
                            child: CircularProgressIndicator(
                              color: MainColor,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(bottom: height * 0.01),
                            child: ButtonCustom(
                              clicked: () {
                                if (_formKey.currentState!.validate() && widget.isInEditPost==false) {
                                  _addPost();
                                }else if(_formKey.currentState!.validate() && widget.isInEditPost==true){
                                  _updatePost();
                                }
                              },
                              text: widget.isInEditPost ? "Modifier" : "Publier",
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
