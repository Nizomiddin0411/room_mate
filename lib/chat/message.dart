import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class Messages extends StatefulWidget {
  String name;
  int id;
  Messages({required this.name, required this.id});
  @override
  _MessagesState createState() => _MessagesState(name: name, id: id);
}

class _MessagesState extends State<Messages> {
  String name;
  int id;
    int myId = Hive.box('id').get('id');
  _MessagesState({required this.name, required this.id});

  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 6.h),
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            itemBuilder: (_, index) {
              QueryDocumentSnapshot qs = snapshot.data!.docs[index];
              Timestamp t = qs['time'];
              DateTime d = t.toDate();
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                child: Column(
                  crossAxisAlignment: name == qs['name']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    id == qs['id'] && myId == qs['myId'] ?
                    Container(
                      width: id == qs['id'] && myId == qs['myId'] ? 280.w : 0,
                      decoration: BoxDecoration(
                          color: name != qs['name']
                              ? Colors.white
                              : Color.fromRGBO(225, 254, 198, 1),
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 3),
                              color: name != qs['name']
                                  ? Color.fromARGB(255, 171, 166, 166)
                                  : Color.fromARGB(255, 146, 154, 142),
                              blurRadius: 4,
                            )
                          ]),
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 236.w,
                              child: Padding(
                                padding:  EdgeInsets.only(bottom: 12.h),
                                child: Text(
                                  qs['message'],
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              d.minute > 9
                                  ? d.hour.toString() +
                                      ":" +
                                      d.minute.toString()
                                  : d.hour.toString() +
                                      ":0" +
                                      d.minute.toString(),
                              style: TextStyle(
                                  color: name == qs['name']
                                      ? Color.fromRGBO(45, 164, 48, 1)
                                      : Color.fromRGBO(142, 142, 147, 1),
                                  fontSize: 11.sp),
                            ),
                          ],
                        ),
                      ),
                    ) : Container(height: 0,)
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
