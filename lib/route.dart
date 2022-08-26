import 'package:dope_chat/features/account/screen/account_screen.dart';
import 'package:dope_chat/features/account/screen/user_edit.dart';
import 'package:dope_chat/features/auth/screen/auth_screen.dart';
import 'package:dope_chat/features/auth/screen/auth_user_info.dart';
import 'package:dope_chat/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());

    case AuthInfoScreen.routeName:
      return MaterialPageRoute(builder: (context) => AuthInfoScreen());

    case SearchScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SearchScreen());
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

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Somthing went Wrong'),
                ),
              ));
  }
}
