import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/Home/home.dart';
import 'package:film/future/view/mybottom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyBottomTabbar(index: 0)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: MyTheme.white,
      )),
    );
  }
}
