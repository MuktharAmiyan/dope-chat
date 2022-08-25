import 'package:dope_chat/common/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UserEditScreen extends StatefulWidget {
  static const routeName = '/user-edit-screen';
  final String userName;
  final String dob;

  const UserEditScreen({Key? key, required this.userName, required this.dob})
      : super(key: key);

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
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
  void initState() {
    super.initState();
    nameController.text = widget.userName;
    dobController.text = widget.dob;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.accents[10],
                  radius: 50,
                ),
                Positioned(
                  bottom: 0,
                  right: -10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              ],
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
    );
  }
}
