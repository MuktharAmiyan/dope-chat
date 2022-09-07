import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String lastMessage;
  final bool isOnline;
  final VoidCallback? onTap;

  const UserTile(
      {Key? key,
      required this.profileImage,
      required this.userName,
      required this.lastMessage,
      required this.isOnline,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          //backgroundImage: NetworkImage(profileImage),
          backgroundColor: Colors.greenAccent,
          radius: 28,
        ),
        title: Text(
          userName,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        subtitle: Text(
          lastMessage,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: CircleAvatar(
          backgroundColor: isOnline ? Colors.green : Colors.red,
          radius: 5,
        ));
  }
}
