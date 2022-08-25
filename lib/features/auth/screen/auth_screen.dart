import 'package:dope_chat/common/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryCodeController =
      TextEditingController(text: '+91');
  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "Signin With Phone Number",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 60,
                        child: CustomTextField(
                          controller: _countryCodeController,
                          hintText: '',
                        )),
                    SizedBox(
                      width: size.width / 1.5,
                      child: CustomTextField(
                        controller: _phoneNumberController,
                        hintText: 'Enter Phone Number',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
      floatingActionButton: SizedBox(
        width: 80,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {},
          backgroundColor: Colors.blueGrey,
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
