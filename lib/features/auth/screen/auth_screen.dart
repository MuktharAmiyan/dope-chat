import 'package:country_picker/country_picker.dart';
import 'package:dope_chat/common/utils/utils.dart';
import 'package:dope_chat/common/widgets/custom_text_fields.dart';
import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth-screen';

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryCodeController =
      TextEditingController(text: '+91');

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (country) {
          _countryCodeController.text = "+${country.phoneCode}";
        });
  }

  void verifyPhoneNumber() {
    if (_phoneNumberController.text.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhoneNumber(context,
          "${_countryCodeController.text}${_phoneNumberController.text.trim()}");
    } else {
      showSnakBar(context, "Enter all fields");
    }
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
                        width: 70,
                        child: CustomTextField(
                          readOnly: true,
                          controller: _countryCodeController,
                          hintText: '',
                          ontap: pickCountry,
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
          onPressed: verifyPhoneNumber,
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
