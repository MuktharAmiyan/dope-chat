// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dope_chat/common/const/colors.dart';

class ConfirmSentFile extends StatelessWidget {
  static const String routeName = '/confirm-sent-file';
  final File file;
  const ConfirmSentFile({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
      ),
      body: Center(
        child: AspectRatio(aspectRatio: 9 / 16, child: Image.file(file)),
      ),
    );
  }
}
