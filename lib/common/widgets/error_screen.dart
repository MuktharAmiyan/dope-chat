import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorText;
  const ErrorScreen({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorText),
      ),
    );
  }
}
