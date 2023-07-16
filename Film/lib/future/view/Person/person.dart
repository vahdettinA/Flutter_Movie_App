import 'package:film/future/theme/mytheme.dart';

import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [],
      ),
    );
  }
}
