import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({super.key});

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  ImagePicker _picker = ImagePicker();
  XFile? file;
  List<XFile>? files;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey,
              child: Center(
                  child: file == null
                      ? Text("Image not picked")
                      : Image.file(File(file!.path))),
            ),
            ElevatedButton(
                onPressed: () async {
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    file = photo;
                  });
                  print("Iamge Picked");
                },
                child: Text("Pick Img")),
            ElevatedButton(
                onPressed: () async {
                  final List<XFile> photos = await _picker.pickMultiImage();
                  // final XFile? photo =
                  //     await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    files = photos;
                  });
                  print("Iamge Picked");
                },
                child: Text("Pick Images"))
          ],
        ),
      ),
    );
  }
}
