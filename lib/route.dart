import 'dart:io';
import 'package:dope_chat/features/account/screen/account_screen.dart';
import 'package:dope_chat/features/account/screen/user_edit.dart';
import 'package:dope_chat/features/auth/screen/auth_screen.dart';
import 'package:dope_chat/features/auth/screen/auth_user_info.dart';
import 'package:dope_chat/features/auth/screen/otp_screen.dart';
import 'package:dope_chat/features/chat/screen/chat_screen.dart';
import 'package:dope_chat/features/chat/screen/chat_userscreen.dart';
import 'package:dope_chat/features/chat/widgets/confirm_sent_file.dart';
import 'package:dope_chat/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());
    case OtpScreen.routeName:
      final otp = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => OtpScreen(otp: otp));

    case AuthUserInfoScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const AuthUserInfoScreen());
    case ChatScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ChatScreen());
    case SearchScreen.routeName:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    case AccountScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AccountScreen());

    case UserEditScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final userName = arguments['userName'];
      final dob = arguments['dob'];
      return MaterialPageRoute(
        builder: (context) => UserEditScreen(
          userName: userName,
          dob: dob,
        ),
      );
    case ChatUserScreen.routeName:
      return MaterialPageRoute(builder: (context) {
        final arguments = settings.arguments as Map<String, dynamic>;
        final uid = arguments['uid'];
        return ChatUserScreen(
          uid: uid,
        );
      });

    case ConfirmSentFile.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
          builder: (context) => ConfirmSentFile(file: file));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Somthing went Wrong'),
                ),
              ));
  }
}
