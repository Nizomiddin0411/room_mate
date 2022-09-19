import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
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
  int id;
  ChatPage(this.name, this.id);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int myId = Hive.box('id').get('id');

  final fs = FirebaseFirestore.instance;
  final TextEditingController message = new TextEditingController();
  bool _isEmpty = true;
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> _image = [];
  final picker = ImagePicker();
  int? _lichId;


  @override
  void initState() {
    _lichId = myId * widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(60, 104, 255, 1),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w, left: 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://ahvalnews.com/sites/default/files/styles/is_home_content_second_440x440_2/public/2020-01/Polat-Alemdar.jpg?h=885b497d&itok=LkqYqDwp"),
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp),
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
              height: MediaQuery.of(context).size.height * 0.85.h,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bgimg.png"),
                        fit: BoxFit.fill)),
                child: SingleChildScrollView(
                  child: Messages(name: widget.name, id: widget.id),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 6.w, top: 6.h, right: 8.w, bottom: 8.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 6.w),
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
                          size: 28.sp,
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
                          helperStyle: TextStyle(
                              color: Color.fromRGBO(174, 174, 178, 1)),
                          enabled: true,
                          contentPadding: EdgeInsets.only(
                              left: 12.0.w, bottom: 8.0.h, top: 8.0.h),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(209, 209, 214, 1)),
                            borderRadius: new BorderRadius.circular(18.r),
                          ),
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(209, 209, 214, 1)),
                            borderRadius: new BorderRadius.circular(18.r),
                          ),
                        ),
                        onSaved: (value) {
                          message.text = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: InkWell(
                        child: Icon(
                          Icons.send_sharp,
                          color: !_isEmpty
                              ? Colors.green.shade700
                              : Color.fromRGBO(151, 151, 151, 1),
                        ),
                        onTap: () {
                          if (message.text.isNotEmpty) {
                            // Messages page qismi uchun (all_chats.dart)
                              fs.doc('Messages/$_lichId').set({
                                'message': FieldValue.arrayUnion(
                                    [message.text.trim()]),
                                'time': FieldValue.arrayUnion([DateTime.now()]),
                                'name': widget.name,
                                'myId': myId,
                                'id': widget.id
                              });
                            // Lichkaga kirib yozish uchun  (message.dart)
                            fs.doc('Messages/$_lichId').collection('msg').doc().set({
                                'message': message.text.trim(),
                                'time': DateTime.now(),
                                'name': widget.name,
                                'myId': myId,
                                'id': widget.id
                              });
                            Hive.box('Id').put('Id', widget.id);
                            message.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // chooseImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image.add(File(pickedFile!.path));
  //   });
  //   if (pickedFile!.path == null) retrieveLostData();
  // }

  // Future<void> retrieveLostData() async {
  //   final LostData response = await picker.getLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _image.add(File(response.file!.path));
  //     });
  //   } else {
  //     print(response.file);
  //   }
  // }

  // Future uploadFile() async {
  //   int i = 1;

  //   for (var img in _image) {
  //     setState(() {
  //       val = i / _image.length;
  //     });
  //     ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('images/${Path.basename(img.path)}');
  //     await ref.putFile(img).whenComplete(() async {
  //       await ref.getDownloadURL().then((value) {
  //         imgRef.add({'url': value});
  //         i++;
  //       });
  //     });
  //   }
  // }
}
