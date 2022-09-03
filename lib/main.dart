import 'package:dope_chat/common/widgets/error_screen.dart';
import 'package:dope_chat/common/widgets/loader.dart';
import 'package:dope_chat/features/auth/controller/auth_controller.dart';
import 'package:dope_chat/features/chat/screen/chat_screen.dart';
import 'package:dope_chat/features/landing/screen/intro_page_screen.dart';
import 'package:dope_chat/firebase_options.dart';
import 'package:dope_chat/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(getUserDataAuthProvider).when(
            data: (user) {
              return user == null
                  ? const IndroductionPage()
                  : const ChatScreen();
            },
            error: (error, stackTrace) =>
                ErrorScreen(errorText: error.toString()),
            loading: () => const Scaffold(
              body: Loader(),
            ),
          ),
    );
  }
}
