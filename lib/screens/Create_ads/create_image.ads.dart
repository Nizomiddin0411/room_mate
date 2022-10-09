import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/screens/Create_ads/create_succed_dart.dart';

import '../../core/const/app_colors.dart';

class Createimage extends StatefulWidget {
  String metro;
  String titlecontroller1;
  String viloyatidisi;
  String viloyatvalue;
  String universiteteid;
  String univervalue;
  String titleGendor;
  String titlecount;
  String phoneController;
  String house;
  String addinformation;
  String numbervalue;
  String comfort;
  String? costlivekomunal;
  String countroom;
  String housetype;
  String in_floor;
  String cost_type;

  Createimage(
      {Key? key,
      required this.numbervalue,
      required this.house,
      required this.phoneController,
      required this.addinformation,
      required this.univervalue,
      required this.universiteteid,
      required this.viloyatvalue,
      required this.viloyatidisi,
      required this.titlecontroller1,
      required this.titlecount,
      required this.titleGendor,
      required this.comfort,
      required this.metro,
      required this.costlivekomunal,
      required this.countroom,
      required this.housetype,
      required this.in_floor,
      required this.cost_type})
      : super(key: key);

  @override
  State<Createimage> createState() => _CreateimageState();
}

class _CreateimageState extends State<Createimage> {
  List<File> imageList = [];
  List<bool> imageExist = [];
  late int btn;
  File? imgFile;
  final imgPicker = ImagePicker();
  File? file;
  ImagePicker image = ImagePicker();

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Rasm yuklash")),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("From Camera"),
                    onTap: () {
                      getcam();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("From Gallery"),
                    onTap: () {
                      getgall();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "E’lon yaratish",
          style: TextStyle(color: Colors.blue),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: DottedBorder(
                          dashPattern: [6, 3],
                          color: Colors.black,
                          strokeWidth: 0.5,
                          child: InkWell(
                            onTap: () async {
                              showOptionsDialog(context);
                              setState(() {
                                btn = 0;
                              });
                            },
                            child: Container(
                              height: 250.h,
                              width: 250.w,
                              color: Colors.black12,
                              child: file == null
                                  ? Icon(
                                      Icons.camera_alt_sharp,
                                      size: 50,
                                    )
                                  : Image.file(
                                      file!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        width: 250.w,
                        height: 250.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Asosiy rasm"),
                  Divider(
                    height: 20.0,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showOptionsDialog(context);
                                },
                                child: Container(
                                  height: 126.h,
                                  width: 95.w,
                                  color: Colors.black12,
                                  child: file == null
                                      ? Icon(
                                          Icons.add,
                                          size: 30,
                                        )
                                      : Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 0, 1, 0),
                            child: Container(
                              height: 20,
                              width: 24,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showOptionsDialog(context);
                                },
                                child: Container(
                                  height: 126.h,
                                  width: 95.w,
                                  color: Colors.black12,
                                  child: file == null
                                      ? Icon(
                                          Icons.add,
                                          size: 30,
                                        )
                                      : Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 0, 1, 0),
                            child: Container(
                              height: 20,
                              width: 24,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showOptionsDialog(context);
                                },
                                child: Container(
                                  height: 126.h,
                                  width: 95.w,
                                  color: Colors.black12,
                                  child: file == null
                                      ? Icon(
                                          Icons.add,
                                          size: 30,
                                        )
                                      : Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 0, 1, 0),
                            child: Container(
                              height: 20,
                              width: 24,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        primary: AppColors.buttonLinear),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateSuccedful()));
                    },
                    child: Text(
                      "E’lonni saqlash".tr(),
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imgFile!, width: 350, height: 350);
    }
  }

  getcam() async {
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
