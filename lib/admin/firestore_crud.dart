import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Crud {
  final collection = FirebaseFirestore.instance.collection('texte');
}

Future<String> getText() async {
  CollectionReference texte = FirebaseFirestore.instance.collection('texte');

  DocumentSnapshot snapshot = await texte.doc('header').get();

  Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

  return data['titlu'];
}

getData() async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('texte').doc('header');

  DocumentSnapshot documentSnapshot = await documentReference.get();

  return documentSnapshot;
}
