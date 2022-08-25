import 'package:dope_chat/common/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => UserTile(
        profileImage: "",
        userName: "UserName",
        lastMessage: 'lastMessage',
        isOnline: true,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
    );
  }
}
