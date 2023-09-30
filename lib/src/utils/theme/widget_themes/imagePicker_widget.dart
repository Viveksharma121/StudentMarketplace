import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("no image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Upload images",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Column(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: _image == null
                      ? const Icon(
                          Icons.photo_library_rounded,
                          color: Colors.grey,
                        )
                      : Image.file(_image!),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: getImage,
                      child: Text("Upload Image"),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
