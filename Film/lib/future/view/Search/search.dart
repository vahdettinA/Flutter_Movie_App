import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/Search/program_search.dart';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  MyService service = MyService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyTheme.black,
          title: Text(
            "Kategoriler",
            style: TextStyle(
                color: MyTheme.white, fontFamily: 'PTSerif', fontSize: 24),
          ),
          elevation: 0,
          bottom: TabBar(
              indicatorColor: MyTheme.green,
              labelStyle: TextStyle(
                  color: MyTheme.white, fontFamily: 'PTSerif', fontSize: 15),
              tabs: [
                Tab(
                  text: "Dizi",
                ),
                Tab(
                  text: "Belgesel",
                ),
                Tab(
                  text: "Çocuk",
                ),
                Tab(
                  text: "Film",
                )
              ]),
        ),
        body: TabBarView(children: [
          ProgramAra(
            stream: service.program("diziler"),
            name: "diziler",
            model: service,
          ),
          ProgramAra(
            stream: service.program("belgeseller"),
            name: "belgeseller",
            model: service,
          ),
          ProgramAra(
            stream: service.program("cizgifilm"),
            name: "cizgifilm",
            model: service,
          ),
          ProgramAra(
            stream: service.filmler(),
            name: "filmler",
            model: service,
            isFilm: true,
          )
        ]),
      ),
    );
  }
}
