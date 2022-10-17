import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
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
  String costController;
  String rent_type;
  String cost_period;
  String location;

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
      required this.costController,
      required this.rent_type,
      required this.cost_period,
      required this.location})
      : super(key: key);

  @override
  State<Createimage> createState() => _CreateimageState();
}

class _CreateimageState extends State<Createimage> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];
  List<XFile>? pickedFile;
  List<File> FileList = [];
  List<bool> FileExist = [];

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

  void initState() {
    // TODO: implement initState
    super.initState();
    FileList.insert(0, File(''));
    FileList.insert(1, File(''));
    FileList.insert(2, File(''));
    FileList.insert(3, File(''));
    FileList.insert(4, File(''));
    FileList.insert(3, File(''));
    FileExist.insert(0, false);
    FileExist.insert(1, false);
    FileExist.insert(2, false);
    FileExist.insert(3, false);
    FileExist.insert(4, false);
    FileExist.insert(5, false);
  }

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
                    onTap: () async {
                      // getcam();
                      if (sum < 3) {
                        sum += 1;
                        await _takeFromCamera(sum);
                      }
                      setState(() {});

                      Navigator.pop(context);
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text(
                      "From Gallery",
                      style: TextStyle(
                          color: sum < 3 ? Colors.black : Colors.grey.shade300),
                    ),
                    onTap: () async {
                      if (sum < 3) {
                        sum += 1;
                        // selectImages();
                        await _takeFile(sum);
                        setState(() {});
                        print(FileList[0]);
                        print(FileList[1]);
                        print(FileList[2]);
                        Navigator.pop(context);
                      }
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
                                    showOptionsDialog(context);
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
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    Container(
                      height: 240.h,
                      child: ListView(children:
                      //     List.generate(imageFileList!.length, (index) {
                      //   return Column(children: <Widget>[
                      //     Expanded(
                      //       child: Stack(
                      //         children: [
                      //           Container(
                      //             width: 200.w,
                      //             height: 150.h,
                      //             decoration: BoxDecoration(
                      //               borderRadius:
                      //                   BorderRadius.circular(10.r),
                      //             ),
                      //             child: ClipRRect(
                      //               child: Image.file(
                      //                 File(imageFileList![index].path),
                      //                 fit: BoxFit.cover,
                      //               ),
                      //               borderRadius:
                      //                   BorderRadius.circular(10.r),
                      //             ),
                      //           ),
                      //           GestureDetector(
                      //             onTap: () {
                      //               setState(() {
                      //                 // imageFileList!.removeAt(index);
                      //               });
                      //               print(
                      //                   "Nizomiddin${imageFileList!.length}");
                      //             },
                      //             child: Padding(
                      //               padding: EdgeInsets.fromLTRB(
                      //                   60.w, 0, 0, 50.h),
                      //               child: Align(
                      //                 alignment: Alignment.topRight,
                      //                 child: Container(
                      //                     height: 20.h,
                      //                     width: 24.w,
                      //                     decoration: BoxDecoration(
                      //                         color: Colors.red,
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                                 15.r)),
                      //                     child: Icon(Icons.remove,
                      //                         color: Colors.white,
                      //                         size: 20.sp)),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ]);
                      // }),
                      [
                        SizedBox(
                          height: 10.h,
                        ),
                        FileList.isNotEmpty
                            ? Row(
                          children:
                          List.generate(FileList.length, (index) {
                            return (FileExist[index])
                                ?
                            // width: 120.w,
                            Container(
                              width: 108.w,
                              height: 116.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    12.r,
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                      EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 8.h),
                                      decoration: BoxDecoration(
                                        // border: Border.all(
                                        //     color:
                                        //         Colors.),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(
                                                  .1.w, .1.h),
                                              color: Colors.grey
                                                  .shade400,
                                              blurRadius: 6),
                                        ],
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                          10.r,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              FileList[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      child: Container(
                                        width: 18.w,
                                        height: 18.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                4.r),
                                            color: Colors
                                                .red[400]),
                                        child: Icon(
                                          Icons.remove,
                                          size: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onTap: () async {
                                        FileList.removeAt(
                                            index);
                                        // index -= 4;
                                        sum -= 1;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ): Container();
                          }),
                        )
                            : const SizedBox(),
                      ]),
                    ),
                  ]),
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
                              location: widget.location,
                              subway: widget.metro,
                              house_type: widget.housetype,
                              room_count: widget.housecount,
                              floors_count: widget.howcountroom,
                              howcountroom: widget.howcountroom,
                              cost: widget.costController,
                              cost_type: widget.narxnituri,
                              live_with_owner: widget.ownerlive,
                              utility_bills: widget.costlivekomunal,
                              comfort: widget.comfort,
                              renttype: widget.rent_type,
                              cost_period: widget.cost_period,
                              file1:  FileExist[0] ? FileList[0] : FileList[3],
                            file2: FileExist[1] ? FileList[1] : FileList[4],
                            file3: FileExist[2] ? FileList[2] : FileList[5],);
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

  _takeFromCamera(int sum) async {
    final XFile? photo = await ImagePicker().pickImage(
      maxHeight: 235.h,
      maxWidth: 327.w,
      source: ImageSource.camera,
    );
    if (photo != null) {
      final image = File(photo.path);
      // MockData.homeworkFile = image;
      // for(int i = 1;i<=3;i++) {
      FileList.insert(1, image);
      FileExist.insert(1, true);
      print(image.toString());
      // }
    }
  }

  _takeFile(int sum) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'pdf',
        'doc',
      ],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      // var request = http.MultipartRequest("POST", Uri.parse("http://164.68.114.231:8081/bolakay/backend/web//api/homework/save"));
      // request.fields["file"] = file.toString();
      // var pic = await http.MultipartFile.fromPath("file_field", file.path);
      // print(file.name);
      // MockData.fileName = file.name;
      // print(file.path);
      // MockData.homeworkFile = File(file.path!);
      // homeWorkList.add(File(file.path!));
      FileList.insert(sum, File(file.path!));
      FileExist.insert(sum, true);
      return file.path.toString();
    } else {
      return null;
    }
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
