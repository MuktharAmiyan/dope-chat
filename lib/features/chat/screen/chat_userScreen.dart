import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/features/chat/widgets/bottom_text_field.dart';
import 'package:dope_chat/features/chat/widgets/my_message_card.dart';
import 'package:dope_chat/features/chat/widgets/receiver_message_card.dart';
import 'package:dope_chat/info.dart';
import 'package:flutter/material.dart';

class ChatUserScreen extends StatelessWidget {
  static const String routeName = '/user-chat-screen';
  final String uid;
  const ChatUserScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(uid),
        backgroundColor: transparentColor,
      ),
      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: (messages.length) + 1,
            itemBuilder: (context, index) {
              if (index < messages.length) {
                final message = messages[index];
                return message['isMe'] == true
                    ? MyMessageCard(
                        messgaeText: message['text'].toString(),
                        timeSent: message['time'].toString(),
                      )
                    : ReceiverMessageCard(
                        messgaeText: message['text'].toString(),
                        timeSent: message['time'].toString(),
                      );
              } else {
                return const SizedBox(
                  height: 60,
                );
              }
            },
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomTextField(),
          ),
        ],
      ),
    );
  }
}
