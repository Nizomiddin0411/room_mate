import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/chat/add_image.dart';
import 'message.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class ChatPage extends StatefulWidget {
  String name;
  ChatPage({required this.name});
  @override
  _ChatPageState createState() => _ChatPageState(name: name);
}

class _ChatPageState extends State<ChatPage> {
  String name;
  _ChatPageState({required this.name});

  final fs = FirebaseFirestore.instance;
  final TextEditingController message = new TextEditingController();
  bool _isEmpty = true;
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(60, 104, 255, 1),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://ahvalnews.com/sites/default/files/styles/is_home_content_second_440x440_2/public/2020-01/Polat-Alemdar.jpg?h=885b497d&itok=LkqYqDwp"),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bgimg.png"),
                        fit: BoxFit.fill)),
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Messages(name: name),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AddImage()));
                      },
                      child: Icon(
                        Icons.folder,
                        color: Color.fromRGBO(151, 151, 151, 1),
                        size: 28,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: message,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'message',
                        helperStyle:
                            TextStyle(color: Color.fromRGBO(174, 174, 178, 1)),
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 12.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(209, 209, 214, 1)),
                          borderRadius: new BorderRadius.circular(18),
                        ),
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(209, 209, 214, 1)),
                          borderRadius: new BorderRadius.circular(18),
                        ),
                      ),
                      validator: (value) {},
                      onChanged: (e) {
                        setState(() {
                          if (e.length != 0) {
                            _isEmpty = false;
                          } else {
                            _isEmpty = true;
                          }
                        });
                      },
                      onSaved: (value) {
                        message.text = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: InkWell(
                      child: Icon(
                        Icons.send_sharp,
                        color: !_isEmpty
                            ? Colors.green.shade700
                            : Color.fromRGBO(151, 151, 151, 1),
                      ),
                      onTap: () {
                        if (message.text.isNotEmpty) {
                          fs.collection('Messages').doc().set({
                            'message': message.text.trim(),
                            'time': DateTime.now(),
                            'name': name,
                          });
                          _isEmpty = true;
                          setState(() {});

                          message.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          i++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }
}
