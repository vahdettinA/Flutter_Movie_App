import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/view/Canli_Yayin/canli.dart';

class MyService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Object?>> program(String collection) {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection(collection).snapshots();
    return ref;
  }

  @override
  Stream<DocumentSnapshot> programsezon(String collection, String doc) {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection(collection).doc(doc).snapshots();
    return ref;
  }

  @override
  Stream<DocumentSnapshot> programsezonid(
      String collection, String doc, String collection1, String doc1) {
    firestore = FirebaseFirestore.instance;
    var ref = firestore
        .collection(collection)
        .doc(doc)
        .collection(collection1)
        .doc(doc1)
        .snapshots();
    return ref;
  }

  @override
  Stream<QuerySnapshot<Object?>> filmler() {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection("filmler").snapshots();
    return ref;
  }

  @override
  Stream<QuerySnapshot<Object?>> Canli() {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection("canli").snapshots();
    return ref;
  }

  @override
  Stream<QuerySnapshot<Object?>> imageler() {
    firestore = FirebaseFirestore.instance;
    var ref = firestore.collection("imageslider").snapshots();
    return ref;
  }
}
