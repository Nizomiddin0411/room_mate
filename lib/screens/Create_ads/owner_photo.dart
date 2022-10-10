import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/screens/Create_ads/create_succed_dart.dart';

import '../../core/const/app_colors.dart';

class OwnerCreateImage extends StatefulWidget {
  String? titleController;
  String? roommate_gender;
  String? gender_matter;
  String? district_id;
  String? id;
  String? addressController;
  String? university_id;
  String? university_id_matter;
  String? phoneController;
  String? house_type;
  String? rent_type;
  String? room_count;
  String? floors_count;
  String? in_floor;
  String? costController;
  String? cost_type;
  String? live_with_owner;
  String? utility_electricity;
  String? unility_gaz;
  String? utility_hot_water;
  String? utility_cold_water;
  String? utility_trash;
  String? comfort;
  String? description;

  OwnerCreateImage(
    this.titleController,
    this.roommate_gender,
    this.gender_matter,
    this.district_id,
    this.id,
    this.addressController,
    this.university_id,
    this.university_id_matter,
    this.phoneController,
    this.house_type,
    this.rent_type,
    this.room_count,
    this.floors_count,
    this.in_floor,
    this.costController,
    this.cost_type,
    this.live_with_owner,
    this.utility_electricity,
    this.unility_gaz,
    this.utility_hot_water,
    this.utility_cold_water,
    this.utility_trash,
    this.comfort,
    this.description
  );



  @override
  State<OwnerCreateImage> createState() => _OwnerCreateImageState();
}

class _OwnerCreateImageState extends State<OwnerCreateImage> {
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
                height: 10.h,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: DottedBorder(
                          dashPattern: [6, 3],
                          color: Colors.black,
                          strokeWidth: 1,
                          child: InkWell(
                            onTap: ()
                            async{
                              await _takeFromCamera(0);
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
                                size: 50.sp,
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
                    height: 15.h,
                  ),
                  Text("Asosiy rasm"),
                  Divider(
                    height: 20.0.h,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10.h),

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
                                 height: 110.h,
                                 width: 90.w,
                                 decoration: BoxDecoration(
                                 color: Colors.black12,
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(4.r))),
                                 child: file == null
                                     ? Icon(
                                   Icons.add,
                                   size: 30.sp,
                                 )
                                     : Image.file(
                                   file!,
                                   fit: BoxFit.fill,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Padding(
                           padding:  EdgeInsets.fromLTRB(80.w, 0, 4.w, 0),
                           child: Container(
                             height: 18.h,
                             width: 18.w,
                             child: Icon(
                               Icons.remove,
                               color: Colors.white,
                               size: 19.sp,
                             ),
                             decoration: BoxDecoration(
                                 color: Colors.red,
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(4.r))),
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
                                  height: 110.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4.r))),
                                  child: file == null
                                      ? Icon(
                                    Icons.add,
                                    size: 30.sp,
                                  )
                                      : Image.file(
                                    file!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.fromLTRB(80.w, 0, 4.w, 0),
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 19.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
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
                                  height: 110.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(4.r)
                                  ),
                                  child: file == null
                                      ? Icon(
                                    Icons.add,
                                    size: 30.sp,
                                  )
                                      : Image.file(
                                    file!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(80.w, 0, 4.w, 0),
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 19.sp,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ],
              ),
              SizedBox(
                height: 134.h,
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
                height: 15.h,
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
      return Image.file(imgFile!, width: 350.w, height: 350.h);
    }
  }

  _takeFromCamera(int Ind) async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo != null) {
      final image = File(photo.path);
      // imageList.add(image);
      imageList.removeAt(Ind);
      imageExist.removeAt(Ind);

      imageList.insert(Ind, image);
      imageExist.insert(Ind, true);
    }
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
