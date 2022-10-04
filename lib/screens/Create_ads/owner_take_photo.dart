import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/Create_ads/owner_photo.dart';
class OwnerPhotoAdds extends StatefulWidget {
  const OwnerPhotoAdds({Key? key}) : super(key: key);

  @override
  State<OwnerPhotoAdds> createState() => _OwnerPhotoAddsState();
}

class _OwnerPhotoAddsState extends State<OwnerPhotoAdds> {

  List<File> imageList = [];
  List<bool> imageExist = [];
  File? imgFile;
  final imgPicker = ImagePicker();

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Add image")),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Image From Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
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
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: (){
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                child: DottedBorder(
                  dashPattern: [6, 3],
                  color: Colors.black,
                  strokeWidth: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(90, 70, 50, 0),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              showOptionsDialog(context);
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 40,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Rasm yuklang",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
                width: 250.w,
                height: 250.h,
              ),
            ),
            SizedBox(
              height: 250.h,
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
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerPhoto()));
                  },
                  child: Text(
                    "E’lonni saqlash ".tr(),
                    style:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 6.r,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 7.r,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  width: 100.w,
                  height: 5.h,
                  color: Color.fromRGBO(228, 228, 228, 1),
                ),
                SizedBox(
                  width: 3.w,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 6.r,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 7.r,
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  width: 100.w,
                  height: 5.h,
                  color: Color.fromRGBO(228, 228, 228, 1),
                ),
                SizedBox(
                  width: 3.w,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 6.r,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 7.r,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70.w,
                  child: Text(
                    "E’lon",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.w,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 70.w,
                  child: Text(
                    "Xonadon \nma’lumotlari\n",
                    style: TextStyle(fontSize: 12.w, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 70.w,
                  child: Text(
                    "E’lonni \njoylashtirish\n",
                    style: TextStyle(fontSize: 12.w, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
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

  Widget displayImage(){
    if(imgFile == null){
      return Text("No Image Selected!");
    } else{
      return Image.file(imgFile!, width: 350, height: 350);
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
}

