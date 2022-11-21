import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/provider/favorite_provider.dart';
import 'package:talaba_uy/screens/Create_ads/create_succed_dart.dart';
import '../../core/const/app_colors.dart';
import '../../core/const/consts.dart';

class AdsPhotoEdit extends StatefulWidget {
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
  String? subway;
  List<dynamic>? Image;
  AdsPhotoEdit(
      {required this.titleController,
      required this.roommate_gender,
      required this.gender_matter,
      required this.district_id,
      required this.addressController,
      required this.location,
      required this.university_id,
      required this.university_id_matter,
      required this.id,
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
      required this.description,
      required this.cost_period,
      required this.subway,
      required this.Image});

  @override
  State<AdsPhotoEdit> createState() => _AdsPhotoEditState();
}

class _AdsPhotoEditState extends State<AdsPhotoEdit> {
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
            title: const Center(child: Text("Rasm yuklash")),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Text("From Camera"),
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
                  Padding(padding: EdgeInsets.all(10.r)),
                  GestureDetector(
                    child: Text(
                      "From Gallery",
                      style: TextStyle(
                        color: sum < 4 ? Colors.black : Colors.grey.shade300,
                      ),
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
          centerTitle: true,
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
          title: const Text(
            "E’lon o'zgartirish",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                            width: double.infinity,
                            // color: AppColors.iconBack,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.Image!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 100.w,
                                  height: 50.h,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${Const.baseUrl}uploads/image/${widget.Image![index].image.toString()}',

                                    placeholder: (context, url) =>
                                    const Center(
                                        child:
                                        CircularProgressIndicator()),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            child: DottedBorder(
                              dashPattern: [3, 1],
                              color: Colors.black,
                              strokeWidth: 0.5.w,
                              child: InkWell(
                                onTap: () async {
                                  showOptionsDialog(context);
                                },
                                child: Container(
                                  height: 100.h,
                                  width: 100.w,
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
                            width: 100.w,
                            height: 100.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // const Text("Asosiy rasm"),
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
                              children: List.generate(FileList.length, (index) {
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
                                                vertical: 8.h,
                                              ),
                                              decoration: BoxDecoration(
                                                // border: Border.all(
                                                //     color:
                                                //         Colors.),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          Offset(.1.w, .1.h),
                                                      color:
                                                          Colors.grey.shade400,
                                                      blurRadius: 6),
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
                                                          BorderRadius.circular(
                                                              4.r),
                                                      color: Colors.red[400]),
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 15.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onTap: () {
                                                  FileList.removeAt(index);
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
                          // print(widget.titleController! + 'title');
                          // print(widget.gender_matter.toString() +
                          //     'gendermatter');
                          // print(widget.district_id.toString() +
                          //     'district id');
                          // print(widget.id.toString() + 'metro');
                          // print(widget.addressController.toString() +
                          //     'address');
                          // print(widget.university_id.toString() +
                          //     'univerid');
                          // print(widget.university_id_matter.toString() +
                          //     'univer matter');
                          // print(widget.phoneController.toString() +
                          //     'phonecontrol');
                          // print(widget.house_type.toString() +
                          //     'house type');
                          // print(
                          //     widget.rent_type.toString() + 'rent type');
                          // print(
                          //     widget.room_count.toString() + 'hona soni');
                          // print(widget.floors_count.toString() +
                          //     'etaj soni');
                          // print(widget.in_floor.toString() + 'etaj');
                          // print(
                          //     widget.costController.toString() + 'narxi');
                          // print(
                          //     widget.cost_type.toString() + 'cost type');
                          // print(widget.live_with_owner.toString() +
                          //     'uyni egasi');
                          // print(widget.utility_electricity.toString() +
                          //     'elktor');
                          // print(widget.unility_gaz.toString() + 'gaz');
                          // print(widget.utility_hot_water.toString() +
                          //     'issiq suv');
                          // print(widget.utility_cold_water.toString() +
                          //     'sovuq suv');
                          // print(
                          //     widget.utility_trash.toString() + 'musor');
                          // print(widget.comfort.toString() + 'komford');
                          // print(widget.description.toString() +
                          //     'qoshimcha');
                          // print(widget.location.toString() + 'location');
                          // print(widget.cost_period.toString() + 'cost');

                          var  data = load.PostUserEdit(
                            id: widget.id,
                            titleController: widget.titleController,
                            roommate_gender: widget.roommate_gender,
                            gender_matter: widget.gender_matter,
                            district_id: widget.district_id,
                            subway: widget.subway,
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
                          print(load.isLoading);
                          if (load.isLoading == false) {
                            showAlertDialog(context);
                          }
                          // setState(() {});

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateSuccedful()),
                              (route) => false);

                          // print(widget.id! + 'title');
                          // print(widget.roommate_gender.toString() +
                          //     'gender');
                          // print(widget.gender_matter.toString() +
                          //     'gendermatter');
                          // print(widget.district_id.toString() +
                          //     'district id');
                          // print(widget.id.toString() + 'metro');
                          // print(widget.addressController.toString() +
                          //     'address');
                          // print(widget.university_id.toString() +
                          //     'univerid');
                          // print(widget.university_id_matter.toString() +
                          //     'univer matter');
                          // print(widget.phoneController.toString() +
                          //     'phonecontrol');
                          // print(widget.house_type.toString() +
                          //     'house type');
                          // print(
                          //     widget.rent_type.toString() + 'rent type');
                          // print(
                          //     widget.room_count.toString() + 'hona soni');
                          // print(widget.floors_count.toString() +
                          //     'etaj soni');
                          // print(widget.in_floor.toString() + 'etaj');
                          // print(
                          //     widget.costController.toString() + 'narxi');
                          // print(
                          //     widget.cost_type.toString() + 'cost type');
                          // print(widget.live_with_owner.toString() +
                          //     'uyni egasi');
                          // print(widget.utility_electricity.toString() +
                          //     'elktor');
                          // print(widget.unility_gaz.toString() + 'gaz');
                          // print(widget.utility_hot_water.toString() +
                          //     'issiq suv');
                          // print(widget.utility_cold_water.toString() +
                          //     'sovuq suv');
                          // print(
                          //     widget.utility_trash.toString() + 'musor');
                          // print(widget.comfort.toString() + 'komford');
                          // print(widget.description.toString() +
                          //     'qoshimcha');
                          // print(widget.location.toString() + 'location');
                          // print(widget.cost_period.toString() + 'cost');
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

  showAlertDialog(BuildContext context) async{
    AlertDialog alert = await AlertDialog(
      actions: [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
