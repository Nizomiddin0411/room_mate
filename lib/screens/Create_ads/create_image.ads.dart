import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/screens/Create_ads/create_succed_dart.dart';
import 'package:talaba_uy/services/post_student_adds.dart';

import '../../core/const/app_colors.dart';
import '../../services/post_create_ads_student.dart';

class Createimage extends StatefulWidget {
  String metro;
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
  String costlivekomunal;
  String countroom;
  String housetype;
  String housecount;
  String howcountroom;
  String narxnituri;
  String addressController;
  String ownerlive;
  String titlecontroller1;
  String viloyatidisi;
  String cost;
  String rent_type;
  String cost_period;
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
      required this.howcountroom,
      required this.narxnituri,
      required this.addressController,
      required this.housecount,
      required this.ownerlive,
      required this.cost,
      required this.rent_type,
      required this.cost_period,
      required this.cost_type})
      : super(key: key);

  @override
  State<Createimage> createState() => _CreateimageState();
}

class _CreateimageState extends State<Createimage> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];
  List<XFile>? pickedFile;

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
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
                      selectImages();
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
          backgroundColor: AppColors.backgroundWhite,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textColor,
            ),
          ),
          title: Text("E’lon yaratish".tr(),
              style: TextStyle(color: AppColors.mainColor)),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            child: Container(
              child: SingleChildScrollView(
                child: Column(children: [
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
                                  onTap: () {
                                    showOptionsDialog(context);

                                    print("Nizomiddin${imageFileList!.length}");
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
                                )),
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    child: GridView.count(
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: 3,
                      children: List.generate(imageFileList!.length, (index) {
                        return Column(children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    child: Image.file(
                                        File(imageFileList![index].path),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      imageFileList!.removeAt(index);
                                    });
                                    print(
                                        "Nizomiddin${imageFileList![index].path}");
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 0, 0, 50),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          height: 20,
                                          width: 24,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Icon(Icons.remove,
                                              color: Colors.white, size: 20)),
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
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            primary: AppColors.buttonLinear),
                        onPressed: () async {
                          await CreateStudent().StudentsAdds(
                              title: widget.titlecontroller1,
                              stay_region_id: widget.viloyatidisi,
                              stay_region_matter: widget.viloyatvalue,
                              stay_university_id: widget.universiteteid,
                              stay_university_matter: widget.univervalue,
                              roommate_gender: widget.titleGendor,
                              roommate_count: widget.titlecount,
                              phone_number: widget.phoneController.toString(),
                              phone_number_show: widget.numbervalue,
                              have_living_home: widget.house,
                              description: widget.addinformation.toString(),
                              district_id: widget.viloyatidisi,
                              address: widget.addressController.toString(),
                              location: widget.titlecontroller1,
                              subway: widget.metro,
                              house_type: widget.housetype,
                              room_count: widget.housecount,
                              floors_count: widget.countroom,
                              howcountroom: widget.howcountroom,
                              cost: widget.cost_type,
                              cost_type: widget.cost_type,
                              live_with_owner: widget.ownerlive,
                              utility_bills: widget.costlivekomunal,
                              comfort: widget.comfort,
                              File: widget.titlecontroller1.toString(),
                              renttype: widget.rent_type,
                              cost_period: widget.cost_period);
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
                      ))
                ]),
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
