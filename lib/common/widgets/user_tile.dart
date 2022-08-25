import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserTile extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String? lastMessage;
  final bool isOnline;
  bool isSearchTitle;
  UserTile(
      {Key? key,
      required this.profileImage,
      required this.userName,
      this.isSearchTitle = false,
      this.lastMessage,
      this.isOnline = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        //backgroundImage: NetworkImage(profileImage),
        backgroundColor: Colors.greenAccent,
        radius: 28,
      ),
      title: Text(
        userName,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
      subtitle: !isSearchTitle
          ? Text(
              lastMessage!,
              style: const TextStyle(color: Colors.grey),
            )
          : null,
      trailing: !isSearchTitle
          ? CircleAvatar(
              backgroundColor: isOnline ? Colors.green : Colors.red,
              radius: 5,
            )
          : null,
    );
  }
}
