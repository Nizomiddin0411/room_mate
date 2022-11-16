import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class Messages extends StatefulWidget {
  String name;
  int id;
  ScrollController scrollController;
  Messages(
      {required this.name, required this.id, required this.scrollController});
  @override
  _MessagesState createState() =>
      _MessagesState(name: name, id: id, scrollController: scrollController);
}

class _MessagesState extends State<Messages> {
  final ScrollController listScrollController = ScrollController();
  String name;
  int id;
  ScrollController scrollController;
  int myId = Hive.box('id').get('id');
  int _index = 0;
  _MessagesState(
      {required this.name, required this.id, required this.scrollController});

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {}
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Messages")
          .doc((id * myId).toString())
          .collection('msg')
          .orderBy("time", descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Container();
        }
        return Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
          child: SingleChildScrollView(
            reverse: true,
            child: ListView.builder(

              itemCount: snapshot.data!.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                Timestamp t = qs['time'];
                DateTime d = t.toDate();
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  child: Column(
                    crossAxisAlignment: id == qs['id']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 280.w,
                        decoration: BoxDecoration(
                            color: id != qs['id']
                                ? Colors.white
                                : const Color.fromRGBO(225, 254, 198, 1),
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 3),
                                color: id != qs['id']
                                    ? const Color.fromARGB(255, 171, 166, 166)
                                    : const Color.fromARGB(255, 146, 154, 142),
                                blurRadius: 4,
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 236.w,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
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
                                  color: id == qs['id']
                                      ? const Color.fromRGBO(45, 164, 48, 1)
                                      : const Color.fromRGBO(142, 142, 147, 1),
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
