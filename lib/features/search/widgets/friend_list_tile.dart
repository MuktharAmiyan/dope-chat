import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:dope_chat/features/search/controller/search_controller.dart';
import 'package:dope_chat/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendListTile extends ConsumerWidget {
  final String uid;
  final bool isFriendList;
  const FriendListTile({
    Key? key,
    required this.uid,
    required this.isFriendList,
  }) : super(key: key);

  void acceptReq(BuildContext context, String userUid, WidgetRef ref) {
    ref.read(searchControllerProvider).acceptRequest(context, userUid);
  }

  void rejectReq(BuildContext context, String userUid, WidgetRef ref) {
    ref.read(searchControllerProvider).rejectRequest(context, userUid);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<UserModel>(
        stream: ref.read(authControllerProvider).getUserDataWithUid(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ListTile();
          }
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data!.profilePic),
            ),
            title: Text(snapshot.data!.name),
            subtitle: Text(
              "@${snapshot.data!.userName}",
              style: const TextStyle(fontSize: 14),
            ),
            trailing: isFriendList
                ? const Icon(Icons.arrow_forward_ios)
                : SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => acceptReq(context, uid, ref),
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () => rejectReq(context, uid, ref),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
            onTap: isFriendList ? null : null,
          );
        });
  }
}
