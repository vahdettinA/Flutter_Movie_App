import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:film/future/view/izle/izle.dart';
import 'package:flutter/material.dart';

class FilmListview extends StatelessWidget {
  Stream<QuerySnapshot> stream;
  FilmListview({required this.stream});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    izlePage(id: myref['id'], live: false)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
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
