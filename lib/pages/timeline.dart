import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    //getUserById();
    //createUser();
    //updateUser();
    deleteUser();
    super.initState();
  }

  createUser() async {
    await usersRef.document('fjkdancdjkasdsaf').setData({
      'username': 'Carlos',
      'isAdmin': false,
      'postsCount': 7,
    });
  }

  updateUser() async {
    final DocumentSnapshot doc =
        await usersRef.document('OcT09KHB8Hgi0juKsAyv').get();
    if (doc.exists) {
      doc.reference.updateData({
        'username': 'Charles',
        'isAdmin': false,
        'postsCount': 7,
      });
    }
  }

  deleteUser() async {
    final DocumentSnapshot doc =
        await usersRef.document('OcT09KHB8Hgi0juKsAyv').get();
    if (doc.exists) {
      doc.reference.delete();
    }
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
        body: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapshot.data.documents
                .map((doc) => Text(doc['username']))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          },
        ));
  }
}
