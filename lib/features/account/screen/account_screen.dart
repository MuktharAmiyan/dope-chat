import 'package:dope_chat/common/const/colors.dart';
import 'package:dope_chat/common/widgets/custom_button.dart';
import 'package:dope_chat/common/widgets/loader.dart';
import 'package:dope_chat/features/account/screen/user_edit.dart';
import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:dope_chat/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerWidget {
  static const routeName = '/account-screen';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: transparentColor,
      ),
      body: SafeArea(
        child: FutureBuilder<UserModel?>(
            future: ref.read(authControllerProvider).getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data!.profilePic),
                            radius: 55,
                          ),
                          SizedBox(
                            width: 120,
                            height: 45,
                            child: CustomButton(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, UserEditScreen.routeName,
                                      arguments: {
                                        'userName': "Mukthar",
                                        'dob': "10102"
                                      });
                                },
                                text: 'Edit Profile'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            customListTile(
                                Icons.person_outline, snapshot.data!.name),
                            customListTile(Icons.phone_iphone, "021548525"),
                            customListTile(Icons.calendar_month_outlined,
                                snapshot.data!.dob.substring(0, 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomButton(onTap: () {}, text: "Log Out"))
                ],
              );
            }),
      ),
    );
  }

  customListTile(IconData iconData, String text) => ListTile(
        horizontalTitleGap: 1,
        leading: Icon(
          iconData,
          size: 30,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      );
}
