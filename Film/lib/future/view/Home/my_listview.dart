import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/bolum/bolumler.dart';
import 'package:flutter/material.dart';

class MyListview extends StatelessWidget {
  Stream<QuerySnapshot> stream;

  MyService model;
  String name;
  MyListview({required this.stream, required this.model, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: MyTheme.black,
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? SizedBox()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    DocumentSnapshot myref = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bolumler(
                                      connection: name,
                                      service: model,
                                      stream: model.programsezon(
                                          name, myref["name"]))));
                        },
                        child: Container(
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(myref["resim"]),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
