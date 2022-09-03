import 'package:dope_chat/common/widgets/user_tile.dart';
import 'package:dope_chat/features/account/screen/account_screen.dart';
import 'package:dope_chat/features/chat/screen/chat_userscreen.dart';
import 'package:dope_chat/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/const/colors.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = 'chat-screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dope Chat.",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: transparentColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: const Icon(Icons.search_outlined)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AccountScreen.routeName);
            },
            child: const CircleAvatar(
              backgroundColor: Colors.green,
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => UserTile(
          profileImage: "",
          userName: "UserName",
          lastMessage: 'lastMessage',
          isOnline: true,
          onTap: () {
            Navigator.pushNamed(context, ChatUserScreen.routeName,
                arguments: {'uid': "jhvajfvkjvzkjgv"});
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
