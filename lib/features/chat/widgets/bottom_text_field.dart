import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/features/chat/widgets/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomTextField extends StatefulWidget {
  const BottomTextField({Key? key}) : super(key: key);

  @override
  State<BottomTextField> createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  final TextEditingController _messageController = TextEditingController();
  bool isRecording = false;

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 50,
            decoration: BoxDecoration(
              color: !isRecording ? brownGrayColor.shade900 : redColor.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                if (!isRecording) ...[
                  IconButton(
                    highlightColor: transparentColor,
                    splashColor: transparentColor,
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: greyColor.shade900,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                          context: context,
                          builder: (context) => _BottomSheetelements());
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: greyColor,
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
                IconButton(
                  highlightColor: transparentColor,
                  splashColor: transparentColor,
                  onPressed: () {
                    if (isRecording) {
                      setState(() {
                        isRecording = false;
                      });
                    } else {
                      setState(() {
                        isRecording = true;
                      });
                    }
                  },
                  icon: Icon(isRecording ? Icons.close : Icons.mic),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: intigoColor.shade800,
              radius: 25,
              child: const Icon(
                Icons.send,
                color: whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _BottomSheetelements() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleButton(
            size: 100,
            buttonColor: blueGrayColor,
            onPressed: () {},
            icon: Icons.camera),
        CircleButton(
            size: 100,
            buttonColor: blueGrayColor,
            onPressed: () {},
            icon: Icons.image),
        CircleButton(
            size: 100,
            buttonColor: blueGrayColor,
            onPressed: () {},
            icon: Icons.videocam),
        CircleButton(
            size: 100,
            buttonColor: blueGrayColor,
            onPressed: () {},
            icon: Icons.video_camera_back)
      ],
    );
  }
}
