import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/profile_screen/profile_avatar.dart';
import '../../Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/profile_controller/profile_controller.dart';
import '../../widgets/image_picker_view/image_picker_sheet.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final profileCtrl = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(editProfile.tr),
        ),
        body: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
                Obx(
                  () => GestureDetector(
                    onTap: profileCtrl.isEdit.value
                        ? () async {
                            // Handle image selection
                            var image = await showImagePickerSheet(context);
                            if (image != null) {
                              profileCtrl.imagePath.value = image;
                            }
                          }
                        : null,
                    child: ProfileAvatar(
                      imageUrl: profileCtrl.imagePath.value,
                      size: 100,
                      borderColor: kWhiteColor,
                      borderWidth: 2.0,
                    ),
                  ),
                ),
                // Profile Image
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
                Gap(10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: FilledButton(
                    child: Text(
                      update1.tr,
                    ),
                    onPressed: () {
                      profileCtrl.editUser(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
