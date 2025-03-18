import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

/// Converts an image from file path or asset into Base64 string.
Future<String> imageConverterTo64(String imagePath) async {
  if (imagePath.isEmpty) {
    return "";
  }

  try {
    if (File(imagePath).existsSync()) {
      // If the image is from the file system (mobile path)
      print('Processing Image from File Path: $imagePath');
      final imageFile = File(imagePath);
      final imageExtension = imagePath.split(".").last;
      final imageBytes = await imageFile.readAsBytes();
      final imageBase64 =
          'data:image/$imageExtension;base64,${base64Encode(imageBytes)}';
      log("Image converted to Base64: $imageBase64");
      return imageBase64;
    } else {
      // If the image is from assets
      print('Processing Image from Asset Path: $imagePath');
      final ByteData byteData = await rootBundle.load(imagePath);
      final Uint8List imageBytes = byteData.buffer.asUint8List();
      final String imageBase64 =
          'data:image/png;base64,${base64Encode(imageBytes)}';
      log("Asset Image converted to Base64: $imageBase64");
      return imageBase64;
    }
  } catch (e) {
    log("Error converting image to Base64: $e");
    return "";
  }
}

dynamic multipleimagesTo64(var selectedImages) async {
  String multiplePicBase64String = ''; // Initialize the base64 string
  int maxImagesToConvert = 10; // Maximum number of images to convert

  for (int i = 0; i < selectedImages.length && i < maxImagesToConvert; i++) {
    final File imageFile = selectedImages[i];
    final extension = imageFile.path.split(".").last;
    final imageBytes = await imageFile.readAsBytes();
    final imageBase64 =
        'data:image/$extension;base64,${base64Encode(imageBytes)}';

    if (multiplePicBase64String.isNotEmpty) {
      // If the string is not empty, add a ';' before adding the new image
      multiplePicBase64String += ';';
    }
    multiplePicBase64String += imageBase64;
  }
  return multiplePicBase64String;
// Now, multiplePicBase64String contains base64 strings of the first 10 images
}
