import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  File? image;
  var xFileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (xFileImage != null) {
    image = File(xFileImage.path);
  }
  return image;
}

Future<File?> pickVideoFromGallery() async {
  File? video;

  var xFileVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
  if (xFileVideo != null) {
    video = File(xFileVideo.path);
  }

  return video;
}

Future<File?> pickImageFromCamera() async {
  File? image;
  var xFileImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if (xFileImage != null) {
    image = File(xFileImage.path);
  }
  return image;
}

Future<File?> pickVideoFromCamera() async {
  File? video;

  var xFileVideo = await ImagePicker().pickVideo(source: ImageSource.camera);
  if (xFileVideo != null) {
    video = File(xFileVideo.path);
  }

  return video;
}

void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
