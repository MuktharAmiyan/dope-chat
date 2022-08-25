import 'package:dope_chat/features/auth/screen/auth_user_info.dart';
import 'package:dope_chat/features/home/screen/home_screen.dart';
import 'package:dope_chat/features/landing/screen/intro_page_screen.dart';
import 'package:dope_chat/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: HomeScreen(),
    );
  }
}
