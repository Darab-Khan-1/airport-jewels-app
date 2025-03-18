import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/color.dart';

class ImagePickerSheet extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  ImagePickerSheet({super.key});

  // Request permission based on the image source (camera or gallery)
  Future<PermissionStatus> _getPermission(ImageSource source) async {
    return source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();
  }

  // Request permission and pick an image if granted
  Future<String?> _requestPermissionAndPickImage(
      BuildContext context, ImageSource source) async {
    final permissionStatus = await _getPermission(source);

    if (permissionStatus.isGranted || permissionStatus.isLimited) {
      return await _pickAndCropImage(context, source);
    } else {
      Get.snackbar(
          'Permission Denied', 'Please enable permission in settings.');
      return null;
    }
  }

  // Pick image from gallery or camera and then crop it
  Future<String?> _pickAndCropImage(
      BuildContext context, ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        var croppedImagePath = await _cropImage(File(pickedFile.path));
        if (croppedImagePath != null) {
          return croppedImagePath; // Return the cropped image path
        }
      } else {
        Get.snackbar('Error', 'No image selected');
      }
      return null;
    } catch (e) {
      log('Error in selecting image: $e');
      Get.snackbar('Error', 'Failed to select an image');
      return null;
    }
  }

  // Crop the selected image
  Future<String?> _cropImage(File pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );

    // Return the cropped image path if available, otherwise null
    return croppedFile?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilledButton(
            onPressed: () async {
              var image = await _requestPermissionAndPickImage(
                  context, ImageSource.gallery);
              if (image != null) {
                Get.back(result: image); // Return image path when selected
              } else {
                Get.back(result: null); // Close if no image selected
              }
            },
            style: Theme.of(context).filledButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStatePropertyAll(kWhiteColor),
                ),
            child: Text(
              'Photo Gallery',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.blue),
            ),
          ),
          Gap(10),
          FilledButton(
            onPressed: () async {
              var image = await _requestPermissionAndPickImage(
                  context, ImageSource.camera);
              if (image != null) {
                Get.back(result: image); // Return image path when selected
              } else {
                Get.back(result: null); // Close if no image selected
              }
            },
            style: Theme.of(context).filledButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStatePropertyAll(kWhiteColor),
                ),
            child: Text(
              'Camera',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.blue),
            ),
          ),
          Gap(10),
          FilledButton(
            onPressed: () =>
                Get.back(result: null), // Close the bottom sheet without action
            style: Theme.of(context).filledButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStatePropertyAll(kWhiteColor),
                ),
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

// Function to show image picker bottom sheet
Future<String?> showImagePickerSheet(BuildContext context) async {
  final String? image = await showModalBottomSheet<String?>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) => ImagePickerSheet(),
  );
  if (image != null) {
    log('Image path: $image');
  } else {
    log('No image selected');
  }
  return image;
}
