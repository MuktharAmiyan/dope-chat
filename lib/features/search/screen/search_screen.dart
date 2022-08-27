import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/common/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          style: const TextStyle(color: whiteColor),
        ),
        backgroundColor: transparentColor,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => UserTile(
                profileImage: "",
                userName: "userName",
                isSearchTitle: true,
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5),
    );
  }
}
