import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/izle/izle.dart';
import 'package:flutter/material.dart';

class Canli extends StatefulWidget {
  const Canli({Key? key}) : super(key: key);

  @override
  State<Canli> createState() => _CanliState();
}

class _CanliState extends State<Canli> {
  MyService service = MyService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyTheme.black,
          elevation: 0,
          title: Text(
            "Canlı Yayınlar",
            style: TextStyle(
                color: MyTheme.white, fontFamily: 'PTSerif', fontSize: 28),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: service.Canli(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? SizedBox()
                : GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      DocumentSnapshot myref = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      izlePage(id: myref['id'], live: true)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 250,
                            width: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(myref["resim"]))),
                          ),
                        ),
                      );
                    });
          },
        ));
  }
}
