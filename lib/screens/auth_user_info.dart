import 'package:dope_chat/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AuthInfoScreen extends StatelessWidget {
  AuthInfoScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  DateTime? selectedDate;

  void _datePicker(BuildContext context) async {
    final date = await DatePicker.showDatePicker(
      context,
      maxTime: DateTime.now(),
    );
    if (date != null) {
      selectedDate = date;
      dobController.text = selectedDate.toString().substring(0, 10);
    } else {
      dobController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: size.width * .25,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -10,
                  child: IconButton(
                    onPressed: () {},
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
                _datePicker(context);
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
          onPressed: () {},
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
