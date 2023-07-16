import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/theme/mytheme.dart';

import 'package:film/future/view/izle/izle.dart';
import 'package:flutter/material.dart';

class Bolumler extends StatefulWidget {
  Stream<DocumentSnapshot> stream;
  String connection;
  MyService service;
  Bolumler(
      {required this.stream, required this.connection, required this.service});

  @override
  State<Bolumler> createState() => _BolumlerState();
}

class _BolumlerState extends State<Bolumler> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.black,
            ),
          )),
      body: StreamBuilder<DocumentSnapshot>(
        stream: widget.stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Center(
                  child: CircularProgressIndicator(color: MyTheme.white),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: size.height * 0.5,
                          width: size.width,
                          child: Image.network(
                            snapshot.data!["resim"],
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Bölümler",
                            style: TextStyle(
                                color: MyTheme.white,
                                fontFamily: 'PTSerif',
                                fontSize: 26)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            color: MyTheme.black,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!["idler"].length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => izlePage(
                                                  id: snapshot.data!["idler"]
                                                      [index],
                                                  live: false))),
                                      child: Container(
                                        height: 250,
                                        width: 180,
                                        color: MyTheme.black,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 180,
                                              width: 180,
                                              child: Image.network(
                                                snapshot.data!["resim"],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data!["name"] +
                                                  "${index + 1}.Bölüm",
                                              style: TextStyle(
                                                  color: MyTheme.white,
                                                  fontSize: 20,
                                                  fontFamily: "PTSerif"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
