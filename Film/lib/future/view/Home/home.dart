import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/theme/mytheme.dart';

import 'package:film/future/view/Home/film_listview.dart';
import 'package:film/future/view/Home/image_slider.dart';
import 'package:film/future/view/Home/my_listview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyService service = MyService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageSlider(stream: service.imageler()),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Diziler",
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          color: MyTheme.white,
                          fontSize: 28,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    MyListview(
                      model: service,
                      stream: service.program("diziler"),
                      name: "diziler",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Belgeseller",
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        color: MyTheme.white,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyListview(
                      model: service,
                      stream: service.program("belgeseller"),
                      name: "belgeseller",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Çizgi Filmler",
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        color: MyTheme.white,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyListview(
                      model: service,
                      stream: service.program("cizgifilm"),
                      name: "cizgifilm",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Filmler",
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        color: MyTheme.white,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FilmListview(stream: service.filmler()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
