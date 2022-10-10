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
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];
  List<XFile> ? pickedFile;

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
                      selectImages();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("From Gallery"),
                    onTap: () {
                      selectImages();
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
          title: const Text("Image Picker Example"),
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
                                onTap: () async {
                                  if(imageList.length<4){
                                    showOptionsDialog(context);
                                  }else{

                                  }
                                  print("Pahlavonnnn${imageFileList!.length}");
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1200,
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
                                    print("Nizomiddin${imageFileList![index].path}");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(60, 0, 0, 50),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child:
                                      Container(
                                          height: 20,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Icon(Icons.remove, color: Colors.white, size: 20)),
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
      imageList = File(img!.path) as List<File>;

    });
  }

  getgall() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
