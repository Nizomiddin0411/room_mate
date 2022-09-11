import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
    String name;
  GalleryScreen({required this.name});
  @override
  _GalleryScreenState createState() => _GalleryScreenState(name: name);
}

class _GalleryScreenState extends State<GalleryScreen> {
   String name;
  _GalleryScreenState({required this.name});

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    Stream<QuerySnapshot> _imageStream = FirebaseFirestore.instance
      .collection('imageURLs')
      .orderBy('time')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(8),
      child: StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.collection("imageURLs").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text("There is some problem loading your images"),
                )
              : snapshot.hasData
                  ? Container(
                    child: ListView(
                      children: snapshot.data!.docs
                            .map((e) => Image.network(e.get("url")))
                            .toList(),
                    ),
                  )
                  : Container();
        },
      ),
    );
  }
}
