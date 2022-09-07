import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/common/widgets/loader.dart';
import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:dope_chat/features/search/controller/search_controller.dart';
import 'package:dope_chat/features/search/widgets/search_user_tile.dart';
import 'package:dope_chat/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String searchString = '';
  final myUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          onChanged: (value) {
            setState(() {
              searchString = value.trim();
            });
          },
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          style: const TextStyle(color: whiteColor),
        ),
        backgroundColor: transparentColor,
      ),
      body: searchString.isEmpty
          ? null
          : StreamBuilder<List<UserModel>>(
              stream: ref
                  .read(searchControllerProvider)
                  .searchUser(context, searchString),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                }
                return snapshot.data!.isEmpty
                    ? const Center(
                        child: Text('no user found'),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final user = snapshot.data![index];
                          return SearchUserTile(
                            user: user,
                            myUid: myUid,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: snapshot.data!.length);
              }),
    );
  }
}
