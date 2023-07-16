import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/service/firebase_service.dart';
import 'package:film/future/view/bolum/bolumler.dart';
import 'package:film/future/view/izle/izle.dart';
import 'package:flutter/material.dart';

class ProgramAra extends StatelessWidget {
  Stream<QuerySnapshot> stream;
  MyService model;
  String name;
  bool isFilm;
  ProgramAra(
      {required this.stream,
      this.isFilm = false,
      required this.model,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: stream,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? SizedBox()
                : GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8),
                    itemBuilder: (BuildContext context, index) {
                      DocumentSnapshot myref = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          isFilm == false
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bolumler(
                                            service: model,
                                            connection: name,
                                            stream: model.programsezon(
                                                name, myref["name"]),
                                          )))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => izlePage(
                                          id: myref['id'], live: false)));
                        },
                        child: Container(
                          height: 250,
                          width: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(myref["resim"]))),
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
