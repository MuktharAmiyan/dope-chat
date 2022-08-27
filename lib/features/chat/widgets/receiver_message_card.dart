// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:dope_chat/common/const/colors.dart';

class ReceiverMessageCard extends StatelessWidget {
  String messgaeText;
  String timeSent;
  ReceiverMessageCard({
    Key? key,
    required this.messgaeText,
    required this.timeSent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 80, maxWidth: size.width - 40),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: greyColor[850],
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 20, bottom: 22),
                child: Text(
                  messgaeText,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  right: 10,
                  child: Text(
                    timeSent,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: greyColor.shade600),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
