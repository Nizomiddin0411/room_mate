import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talaba_uy/chat/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AllChats extends StatefulWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  int myId = Hive.box('id').get('id');
  int leng = 0;
  List _iList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(60, 104, 255, 1),
        leading: InkWell(
          // onTap: () => _scaffoldKey.currentState!.openDrawer(),
          onTap: ()=>Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Messages")
              .orderBy("time", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            int lengFunc(leng) {
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                if (int.parse(snapshot.data!.docs[i].id) % myId == 0) {
                  print(i);
                    leng += 1;
                    _iList.add(i);
                }
              }
              return leng;
            }

            return ListView.builder(
              itemCount: lengFunc(leng),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              itemBuilder: ((context, index) {
                QueryDocumentSnapshot qs = snapshot.data!.docs[_iList[index]];
                return InkWell(
                  onTap: () {
                    
                    print(qs['id']);
                    print(qs['name']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(qs['name'], qs['id'])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/tr/thumb/e/ea/PolatAlemdar.jpg/800px-PolatAlemdar.jpg"),
                      ),
                      title: Text(qs['name']),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
