import 'package:film/firebase_options.dart';

import 'package:film/future/theme/mytheme.dart';

import 'package:film/future/view/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData(
            scaffoldBackgroundColor: MyTheme.black,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: MyTheme.black,
                selectedItemColor: MyTheme.white,
                unselectedItemColor: MyTheme.grey)),
        home: Splash());
  }
}
