import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickController extends GetxController {
  Rxn<File> image = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
      print("path 1 ${image.value}");
      print("path 2 ${pickedImage.path}");
    }
  }
}
