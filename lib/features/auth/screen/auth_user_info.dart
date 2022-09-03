import 'dart:io';

import 'package:dope_chat/common/const/const.dart';
import 'package:dope_chat/common/utils/utils.dart';
import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/custom_text_fields.dart';

class AuthUserInfoScreen extends ConsumerStatefulWidget {
  static const String routeName = 'auth-user-info-screen';
  const AuthUserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AuthUserInfoScreenState();
}

class AuthUserInfoScreenState extends ConsumerState<AuthUserInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  DateTime? selectedDate;
  File? profilePic;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dobController.dispose();
  }

  void datePicker(context) async {
    final date = await DatePicker.showDatePicker(context);
    if (date != null) {
      dobController.text = date.toString().substring(0, 10);
      selectedDate = date;
    } else {
      dobController.clear();
      selectedDate = null;
    }
  }

  void logInToChatScreen(
      BuildContext context, File? profilePic, DateTime? dob) {
    if (nameController.text.trim().isNotEmpty && dob != null) {
      ref.read(authControllerProvider).saveUserDataToFireBase(
          context, nameController.text.trim(), dob.toString(), profilePic);
    } else {
      showSnakBar(context, "Enter all fields");
    }
  }

  void pickImage() async {
    profilePic = await pickImageFromGallery();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                profilePic != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(profilePic!),
                        radius: 60,
                      )
                    : const CircleAvatar(
                        backgroundImage: NetworkImage(defuiltProfilePic),
                        radius: 60,
                      ),
                Positioned(
                  bottom: 0,
                  right: -10,
                  child: IconButton(
                    onPressed: pickImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Enter Name',
              controller: nameController,
            ),
            CustomTextField(
              hintText: 'Select Date Of Birth',
              controller: dobController,
              readOnly: true,
              ontap: () {
                datePicker(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () => logInToChatScreen(context, profilePic, selectedDate),
          backgroundColor: Colors.blueGrey,
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
