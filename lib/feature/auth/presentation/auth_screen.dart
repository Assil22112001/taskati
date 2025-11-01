import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/custom_bottom.dart';
import 'package:taskati/gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  var nameController = TextEditingController();
  openCamera() async {
    final pickedPhoto = await picker.pickImage(source: ImageSource.camera);
    if (pickedPhoto != null) {
      setState(() {
        photo = pickedPhoto;
      });
    }
  }

  openGallery() async {
    final pickedPhoto = await picker.pickImage(source: ImageSource.gallery);
    if (pickedPhoto != null) {
      setState(() {
        photo = pickedPhoto;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo != null,

              replacement: Image.asset(
                Assets.images.noProfilePicture.path,
                height: 200,
                width: 200,
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: Image.file(File(photo?.path ?? "")).image,
              ),
            ),

            Image.file(File(photo?.path ?? "")),
            SizedBox(height: 20),
            CustomBottom(
              onTap: () {
                openCamera();
              },

              title: "Upload from camera",
            ),
            SizedBox(height: 20),
            CustomBottom(
              onTap: () {
                openGallery();
              },
              title: "Upload from Gallery",
            ),
            Divider(height: 50),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hint: Text("Enter your name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            CustomBottom(
              onTap: (){
                
              }
              ,title: "Save"),
          ],
        ),
      ),
    );
  }
}
