import 'package:dope_chat/common/widgets/custom_button.dart';
import 'package:dope_chat/features/search/controller/search_controller.dart';
import 'package:dope_chat/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUserTile extends ConsumerWidget {
  final UserModel user;
  final String myUid;
  final bool isSearch;
  const SearchUserTile({
    Key? key,
    required this.user,
    required this.myUid,
    this.isSearch = true,
  }) : super(key: key);

  void requestFunction(WidgetRef ref, BuildContext context) {
    ref.read(searchControllerProvider).requestFunction(context, user.uid);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(
        "@${user.userName}",
        style: const TextStyle(fontSize: 14),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profilePic),
      ),
      trailing: user.friends.contains(myUid)
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          : user.reqfriends.contains(myUid)
              ? CustomButton(
                  onTap: () => requestFunction(ref, context), text: 'Requested')
              : CustomButton(
                  onTap: () => requestFunction(ref, context),
                  text: 'Add friend'),
      onTap: user.friends.contains(myUid) ? null : null,
    );
  }
}
