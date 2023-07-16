import 'package:flutter/material.dart';

enum Iicons {
  ic_home,
  ic_search,
  ic_tv,
  ic_user,
}

extension IconsExtension on Iicons {
  String get topath => 'assets/icons/$name.png';
  AssetImage get image => AssetImage(topath);
}
