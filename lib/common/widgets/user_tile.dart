import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String? lastMessage;
  final bool? isOnline;
  final VoidCallback? onTap;
  final bool isSearchTitle;
  const UserTile(
      {Key? key,
      required this.profileImage,
      required this.userName,
      this.isSearchTitle = false,
      this.lastMessage,
      this.isOnline,
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
      subtitle: !isSearchTitle
          ? Text(
              lastMessage!,
              style: const TextStyle(color: Colors.grey),
            )
          : null,
      trailing: !isSearchTitle
          ? CircleAvatar(
              backgroundColor: isOnline! ? Colors.green : Colors.red,
              radius: 5,
            )
          : null,
    );
  }
}
