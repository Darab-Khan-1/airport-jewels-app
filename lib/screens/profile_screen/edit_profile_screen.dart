import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../Widgets/image_picker_view/image_picker_sheet.dart';
import '../../Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/profile_controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key}) {
    // Set isEdit to true when the screen is created to enable avatar editing
    profileCtrl.isEdit.value = true;
  }

  final profileCtrl = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editProfile.tr),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(50),
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    // Removed the conditional check to always allow image selection
                    if (kDebugMode) {
                      print("Avatar tapped!");
                    }
                    var image = await showImagePickerSheet(context);
                    if (image != null) {
                      if (kDebugMode) {
                        print("Image selected: $image");
                      }
                      profileCtrl.imagePath.value = image;
                    } else {
                      if (kDebugMode) {
                        print("No image selected");
                      }
                    }
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: kWhiteColor,
                        backgroundImage: profileCtrl.imagePath.value.isNotEmpty
                            ? NetworkImage(profileCtrl.imagePath.value)
                            : null,
                        child: profileCtrl.imagePath.value.isEmpty
                            ? const Icon(Icons.person,
                                size: 50, color: Colors.grey)
                            : null,
                      ),
                      // Add a camera icon indicator to show it's clickable
                      const Positioned(
                        bottom: 0,
                        right: 10,
                        child: Icon(
                          Icons.camera_alt,
                          color: kGreyColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: name.tr,
                controller: profileCtrl.nameController.value,
                prefixIcon: const Icon(Icons.person),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: address.tr,
                controller: profileCtrl.addressController.value,
                prefixIcon: const Icon(Icons.location_on),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: email.tr,
                controller: profileCtrl.emailController.value,
                prefixIcon: const Icon(Icons.email),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: phone.tr,
                controller: profileCtrl.phoneController.value,
                prefixIcon: const Icon(Icons.phone),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: customerType.tr,
                controller: profileCtrl.customerTypeController.value,
                prefixIcon: const Icon(Icons.directions_car_outlined),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: city.tr,
                controller: profileCtrl.cityController.value,
                prefixIcon: const Icon(Icons.location_city),
              ),
              const Gap(30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    profileCtrl.editUser(context);
                  },
                  child: Text(
                    update1.tr,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
