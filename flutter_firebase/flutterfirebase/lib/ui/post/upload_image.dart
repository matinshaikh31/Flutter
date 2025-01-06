import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfirebase/widgets/rounded_button.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the state
      });
    } else {
      print("Image not picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  getImageGallery();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: _image != null
                      ? Image.file(_image!.absolute)
                      : const Icon(Icons.image, size: 50),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedButton(
              title: "Upload",
              onTap: () {
                // Future functionality to upload the image
                if (_image != null) {
                  print("Ready to upload: ${_image!.path}");
                } else {
                  print("No image selected");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
