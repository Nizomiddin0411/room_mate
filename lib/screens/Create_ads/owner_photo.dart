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
      this.description);

  @override
  State<OwnerCreateImage> createState() => _OwnerCreateImageState();
}

class _OwnerCreateImageState extends State<OwnerCreateImage> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];
  List<XFile>? pickedFile;

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      pickedFile?.add(getcam());
    }
    setState(() {});
  }

  List<File> imageList = [];
  List<bool> imageExist = [];
  late int btn;
  File? imgFile;
  final imgPicker = ImagePicker();
  File? file;
  ImagePicker image = ImagePicker();
  int sum = 0;

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
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("From Gallery"),
                    onTap: () {
                      sum += 1;
                      selectImages();
                      
                      setState(() {});
                      Navigator.pop(context);
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
              widget.comfort = '';
              setState(() {});
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: DottedBorder(
                                  dashPattern: [6, 3],
                                  color: Colors.black,
                                  strokeWidth: 0.5.w,
                                  child: InkWell(
                                    onTap: () async {
                                      if (sum < 3) {
                                        showOptionsDialog(context);
                                        print(imageList.length);
                                      } else {}
                                     
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
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 240.h,
                        child: GridView.count(
                          crossAxisSpacing: 6.w,
                          mainAxisSpacing: 6.h,
                          crossAxisCount: 3,
                          children:
                              List.generate(imageFileList!.length, (index) {
                            return Column(children: <Widget>[
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 200.w,
                                      height: 150.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: ClipRRect(
                                        child: Image.file(
                                          File(imageFileList![index].path),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          imageFileList!.removeAt(index);
                                        });
                                        print(
                                            "Nizomiddin${imageFileList!.length}");
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            60.w, 0, 0, 50.h),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              height: 20.h,
                                              width: 24.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                              child: Icon(Icons.remove,
                                                  color: Colors.white,
                                                  size: 20.sp)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          }),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 31.w),
                      child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r)),
                                primary: AppColors.buttonLinear),
                            onPressed: () {
                              setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateSuccedful(),
                                ),
                              );
                            },
                            child: Text(
                              "Keyingi ".tr(),
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imageList = File(imgCamera!.path) as List<File>;
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
