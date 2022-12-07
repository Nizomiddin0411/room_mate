import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talaba_uy/screens/Create_ads/create_succed_dart.dart';
import '../../core/const/app_colors.dart';
import '../../provider/favorite_provider.dart';

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
  String? location;
  String? cost_period;
  OwnerCreateImage(
      {required this.cost_period,
      required this.location,
      required this.titleController,
      required this.roommate_gender,
      required this.gender_matter,
      required this.district_id,
      required this.id,
      required this.addressController,
      required this.university_id,
      required this.university_id_matter,
      required this.phoneController,
      required this.house_type,
      required this.rent_type,
      required this.room_count,
      required this.floors_count,
      required this.in_floor,
      required this.costController,
      required this.cost_type,
      required this.live_with_owner,
      required this.utility_electricity,
      required this.unility_gaz,
      required this.utility_hot_water,
      required this.utility_cold_water,
      required this.utility_trash,
      required this.comfort,
      required this.description});

  @override
  State<OwnerCreateImage> createState() => _OwnerCreateImageState();
}

class _OwnerCreateImageState extends State<OwnerCreateImage> {
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
  @override
  void initState() {
    // print(widget.comfort);

    // TODO: implement initState
    super.initState();
    FileList.insert(0, File(''));
    FileList.insert(1, File(''));
    FileList.insert(2, File(''));
    FileList.insert(3, File(''));
    FileList.insert(4, File(''));

    FileExist.insert(0, false);
    FileExist.insert(1, false);
    FileExist.insert(2, false);
    FileExist.insert(3, false);
    FileExist.insert(4, false);
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Rasm yuklash".tr())),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text(
                      "Rasimga olish".tr(),
                      style: TextStyle(
                          color: sum < 4 ? Colors.black : Colors.grey.shade300),
                    ),
                    onTap: () async {
                      // getcam();
                      if (sum < 4) {
                        sum += 1;
                        await _takeFromCamera(sum);
                      }
                      setState(() {});

                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10.w)),
                  GestureDetector(
                    child: Text(
                      "Galeriyadan yuklash".tr(),
                      style: TextStyle(
                          color: sum < 4 ? Colors.black : Colors.grey.shade300),
                    ),
                    onTap: () async {
                      if (sum < 4) {
                        sum += 1;
                        // selectImages();
                        await _takeFile(sum);
                        setState(() {});
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
    final load = context.read<FavoriteProvider>();
    bool loading = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              widget.comfort = '';
              setState(() {});
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: Center(
              child: Text(
            "E’lon yaratish".tr(),
            style: TextStyle(color: Colors.blue),
          )),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              child: DottedBorder(
                                dashPattern: const [6, 3],
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
                        Text("Asosiy rasm".tr()),
                        Divider(
                          height: 20.0.h,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    SizedBox(
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
                            ? Wrap(
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
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 8.w,
                                                    vertical: 8.h),
                                                decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color:
                                                  //         Colors.),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            Offset(.1.w, .1.h),
                                                        color: Colors
                                                            .grey.shade400,
                                                        blurRadius: 6.r),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10.r,
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: FileImage(
                                                        FileList[index]),
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
                                                                .circular(4.r),
                                                        color: Colors.red[400]),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 15.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    FileList.removeAt(index);
                                                    // index -= 4;
                                                    sum -= 1;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container();
                                }),
                              )
                            : const SizedBox(),
                      ]),
                    ),
                  ]),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              primary: AppColors.buttonLinear),
                          onPressed: () async {
                            print(FileList[3]);
                            print(FileList[1]);
                            print(FileList[2]);
                            // if (load.isLoading) {
                            //   return Center(
                            //       child: CircularProgressIndicator());
                            // }
                            // print('oldin');
                            // print(load.isLoading);
                            // load.isload = true;
                            int genMatter = int.parse(widget.gender_matter!);
                            var data = load.PostUser(
                              titleController: widget.titleController,
                              roommate_gender: widget.roommate_gender,
                              gender_matter: genMatter,
                              district_id: widget.district_id,
                              subway: widget.id,
                              addressController: widget.addressController,
                              university_id: widget.university_id,
                              university_id_matter: widget.university_id_matter,
                              phoneController: widget.phoneController,
                              house_type: widget.house_type,
                              rent_type: widget.rent_type,
                              room_count: widget.room_count,
                              floors_count: widget.floors_count,
                              in_floor: widget.in_floor,
                              costController: widget.costController,
                              cost_type: widget.cost_type,
                              live_with_owner: widget.live_with_owner,
                              utility_electricity: widget.utility_electricity,
                              unility_gaz: widget.unility_gaz,
                              utility_hot_water: widget.utility_hot_water,
                              utility_cold_water: widget.utility_cold_water,
                              utility_trash: widget.utility_trash,
                              comfort: widget.comfort,
                              description: widget.description,
                              location: widget.location,
                              cost_period: widget.cost_period,
                              file1: FileExist[0] ? FileList[0] : FileList[4],
                              file2: FileExist[1] ? FileList[1] : FileList[4],
                              file3: FileExist[2] ? FileList[2] : FileList[4],
                              file4: FileExist[3] ? FileList[3] : FileList[4],
                            );
                            // print(widget.gender_matter.toString() + "iddd");
                            // load.isload = false;
                            if (load.isLoading != true) {
                              showAlertDialog(context);
                            }
                            // setState(() {
                            //   loading = load.isLoading;
                            // });

                            // var data = await UserCreateAds().FetchAds(
                            //   titleController: widget.titleController,
                            //   roommate_gender: widget.roommate_gender,
                            //   gender_matter: widget.gender_matter,
                            //   district_id: widget.district_id,
                            //   subway: widget.id,
                            //   addressController: widget.addressController,
                            //   university_id: widget.university_id,
                            //   university_id_matter:
                            //       widget.university_id_matter,
                            //   phoneController: widget.phoneController,
                            //   house_type: widget.house_type,
                            //   rent_type: widget.rent_type,
                            //   room_count: widget.room_count,
                            //   floors_count: widget.floors_count,
                            //   in_floor: widget.in_floor,
                            //   costController: widget.costController,
                            //   cost_type: widget.cost_type,
                            //   live_with_owner: widget.live_with_owner,
                            //   utility_electricity: widget.utility_electricity,
                            //   unility_gaz: widget.unility_gaz,
                            //   utility_hot_water: widget.utility_hot_water,
                            //   utility_cold_water: widget.utility_cold_water,
                            //   utility_trash: widget.utility_trash,
                            //   comfort: widget.comfort,
                            //   description: widget.description,
                            //   location: widget.location,
                            //   file1: FileExist[0] ? FileList[0] : FileList[3],
                            //   cost_period: widget.cost_period,
                            //   file2: FileExist[1] ? FileList[1] : FileList[4],
                            //   file3: FileExist[2] ? FileList[2] : FileList[5],
                            // );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateSuccedful()));
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CreateSuccedful()),
                            //     (route) => false);
                            setState(() {});
                            // if (data['status']) {

                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             CreateSuccedful()),
                            //     (route) => false);
                            // } else {
                            print(widget.titleController! + 'title');
                            print(widget.roommate_gender.toString() + 'gender');
                            print(widget.gender_matter.toString() +
                                'gendermatter');
                            print(
                                widget.district_id.toString() + 'district id');
                            print(widget.id.toString() + 'metro');
                            print(widget.addressController.toString() +
                                'address');
                            print(widget.university_id.toString() + 'univerid');
                            print(widget.university_id_matter.toString() +
                                'univer matter');
                            print(widget.phoneController.toString() +
                                'phonecontrol');
                            print(widget.house_type.toString() + 'house type');
                            print(widget.rent_type.toString() + 'rent type');
                            print(widget.room_count.toString() + 'hona soni');
                            print(widget.floors_count.toString() + 'etaj soni');
                            print(widget.in_floor.toString() + 'etaj');
                            print(widget.costController.toString() + 'narxi');
                            print(widget.cost_type.toString() + 'cost type');
                            print(widget.live_with_owner.toString() +
                                'uyni egasi');
                            print(widget.utility_electricity.toString() +
                                'elktor');
                            print(widget.unility_gaz.toString() + 'gaz');
                            print(widget.utility_hot_water.toString() +
                                'issiq suv');
                            print(widget.utility_cold_water.toString() +
                                'sovuq suv');
                            print(widget.utility_trash.toString() + 'musor');
                            print(widget.comfort.toString() + 'komford');
                            print(widget.description.toString() + 'qoshimcha');
                            print(widget.location.toString() + 'location');
                            print(widget.cost_period.toString() + 'cost perio');
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text(data['error'])));
                          },
                          child: Text(
                            "Keyingi".tr(),
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ],
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
      return const Text("No Image Selected!");
    } else {
      return Image.file(imgFile!, width: 350.w, height: 350.h);
    }
  }

  getcam() async {
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
      print(file);
    });
  }

  getgall() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
      print(file);
    });
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
      FileList.insert(sum, image);
      FileExist.insert(sum, true);
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
}

Circular(BuildContext context) {
  return const CircularProgressIndicator();
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = const AlertDialog(
    // title: Text("Akkauntdan chiqish ").tr(),
    // content: Text("Akkauntdan chiqishga ishonchingiz komilmi?").tr(),
    actions: [
      Center(
        child: CircularProgressIndicator(),
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
