import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttershare/widgets/header.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    getUsers();
    //getUserById();
    super.initState();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef.limit(2).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
    });
  }

  getUserById() async {
    final String id = 'acpWvsL2tG6ZQTYuxqSL';
    final DocumentSnapshot doc = await usersRef.document(id).get();
    print(doc.data);
    print(doc.documentID);
    print(doc.exists);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Text('Timeline'),
    );
  }
}
