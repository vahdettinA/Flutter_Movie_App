import 'package:film/future/product/icon_enum.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/Canli_Yayin/canli.dart';
import 'package:film/future/view/Home/home.dart';
import 'package:film/future/view/Person/person.dart';
import 'package:film/future/view/Search/search.dart';
import 'package:flutter/material.dart';

class MyBottomTabbar extends StatefulWidget {
  int index;
  MyBottomTabbar({required this.index});

  @override
  State<MyBottomTabbar> createState() => _MyBottomTabbarState();
}

class _MyBottomTabbarState extends State<MyBottomTabbar> {
  Widget _body = Home();
  List<Widget> screen = [Home(), Search(), Canli(), Person()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: widget.index,
        iconSize: 24,
        onTap: (value) {
          setState(() {
            widget.index = value;
            _body = screen[widget.index];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(Iicons.ic_home.image),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(Iicons.ic_search.image), label: "Kategoriler"),
          BottomNavigationBarItem(
              icon: ImageIcon(Iicons.ic_tv.image), label: "Canlı Yayın"),
          BottomNavigationBarItem(
              icon: ImageIcon(Iicons.ic_user.image), label: "Profilim"),
        ],
      ),
      body: _body,
    );
  }
}
