import 'package:dope_chat/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CupertinoSearchTextField(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          ),
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => UserTile(
                    profileImage: "",
                    userName: "userName",
                    isSearchTitle: true,
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 5),
        )
      ],
    ));
  }
}
