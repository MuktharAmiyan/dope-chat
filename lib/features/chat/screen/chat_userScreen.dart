import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/features/chat/widgets/my_message_card.dart';
import 'package:dope_chat/features/chat/widgets/receiver_message_card.dart';
import 'package:dope_chat/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatUserScreen extends StatelessWidget {
  const ChatUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('userName'),
        backgroundColor: transparentColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final _message = messages[index];
          return _message['isMe'] == true
              ? MyMessageCard(
                  messgaeText: _message['text'].toString(),
                  timeSent: _message['time'].toString(),
                )
              : ReceiverMessageCard(
                  messgaeText: _message['text'].toString(),
                  timeSent: _message['time'].toString(),
                );
        },
        itemCount: messages.length,
      ),
    );
  }
}
