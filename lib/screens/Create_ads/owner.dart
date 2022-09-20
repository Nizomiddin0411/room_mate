import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';

import 'package:talaba_uy/core/const/app_colors.dart';

import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/menu/menu.dart';

import '../../models/get_district_model.dart';
import '../../services/post_create_ads_service.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  // bool isDistrict = false;
  bool _checkHome = false;
  bool _checkMetro = false;
  String RoomOwner = '';
  String RentOf = '';
  String Subway = '';
  String? _dropownUsd;
  String dropDown = "";
  String TypeHouse = '';
  String CountRoom = '';
  String genderString = '';
  String countRoom = '';
  TextEditingController? addressController;
  TextEditingController? costController;
  TextEditingController? adsTitleController;
  TextEditingController? inputcontroller;
  GetDistrictModel? dropDown1;
  Color colorRegion = Colors.grey;
  bool RegionOnClick = false;
  Color colorDistric = Colors.grey;
  bool DiscritOnClick = false;
  Color colorUniver = Colors.grey;
  bool UniverOnClick = false;
  Color colorTypeHouse = Colors.grey;
  bool TypeHouseOnClick = false;
  Color colorRoomCount = Colors.grey;
  bool RoomCountOnClick = false;
  Color colorRentType = Colors.grey;
  bool RentTypeOnClick = false;
  Color colorTypeCost = Colors.grey;
  bool TypeCostOnClick = false;
  Color colorGender = Colors.grey;
  bool GenderOnClick = false;
  Color colorCountPupil = Colors.grey;
  bool CountPupilOnClick = false;
  Color colorForm = Colors.grey;
  bool FormOnClick = false;
  Color colorFormDescription = Colors.grey;
  bool FormDescriptionOnClick = false;


  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var gender = [
    'Erkak',
    'Ayol',
  ];
  var kindOfMoment = [
    'kunlik',
    'oylik',
  ];
  var rooms = [
    '1',
    '2',
    '3',
    '4',
    '5-6',
  ];
  var ijarachi = [
    '1',
    '2',
    '3',
    '4',
    '5-6',
  ];
  @override
  void initState() {
    addressController = TextEditingController();
    costController = TextEditingController();
    adsTitleController = TextEditingController();
    inputcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Consumer<RegionProvider>(
          builder: (_, data, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Joylashuv",
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.h),
                Text("Viloyat",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  width: 324.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorRegion),),
                  child: DropdownButtonFormField(
                    hint: Text("Viloyatni tanlang"),
                    decoration: const InputDecoration(
                      
                        border: OutlineInputBorder(), focusColor: Colors.grey),
                    // value: ,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    items: data.regions.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.name ?? "",
                        child: Text(e.name.toString()),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      print("Selected ----------- $newValue");
                      final selected = data.regions
                          .where((element) => element.name == newValue);
                      data.getDistrict(selected.last.id!);
                      setState(() {
                        RegionOnClick = true;
                        dropDown = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(height: 12.h),
                Text(
                  "Tuman",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                data.isDistrict
                    ? Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorDistric),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text("Tumanni tanlang"),
                          decoration: const InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              focusColor: Colors.grey),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          items: data.districts.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                print("${e.id}");
                                data.districtOwnerId = e.id.toString();
                              },
                              value: data.isDistrict
                                  ? e.name.toString()
                                  : data.defaultvalue,
                              child: Text(data.isDistrict
                                  ? e.name.toString()
                                  : data.defaultvalue),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            DiscritOnClick = true;
                            print("Selected ----------- $newValue");
                            setState(() {
                              // dropDown1 = newValue as GetDistrictModel?;
                              dropDown = newValue.toString();
                            });
                          },
                        ),
                      )
                    : Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text("Tumanni tanlang"),
                            decoration: const InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
                            onChanged: null),
                      ),
                SizedBox(height: 12.h),
                Text(
                  "Manzil",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorUniver),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onSaved: (e){
                        setState(() {
                          if(e!.length > 0){
                            setState(() {
                              UniverOnClick = true;
                            });
                          }
                        });
                      },
                      controller: addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kvartal , Uy , Xonadon",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  "Xonadon ma’lumoti",
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      child: Checkbox(
                        value: _checkHome,
                        onChanged: (e) {
                          setState(() {
                            
                            _checkHome = e!;
                            if (_checkHome == true) {
                              RoomOwner = '1';
                            } else {
                              RoomOwner = '2';
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text("Uy egasi bilan birga yashashga roziman !!!")
                  ],
                ),
                SizedBox(height: 19.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uy turi",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorTypeHouse),),
                          child: DropdownButtonFormField(
                            hint: Text("uy turi"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: kvartira.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                              TypeHouseOnClick = true;
                                TypeHouse = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Necha xona",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorRoomCount),),
                          child: DropdownButtonFormField(
                            hint: Text("Xonalar soni"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: rooms.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                RoomCountOnClick =true;
                                CountRoom = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "Ijara muddatini kiriting",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 152.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorRentType),),
                  child: DropdownButtonFormField(
                    hint: Text("Ijara muddati"),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), focusColor: Colors.grey),
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    items: kindOfMoment.map((e) {
                      return DropdownMenuItem<String>(
                        onTap: () {},
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        RentTypeOnClick =true;
                        RentOf = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Narxi",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorTypeCost),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onSaved: (e){
                        setState(() {
                          if(e!.length > 0){
                            TypeCostOnClick = true;
                          }
                        });
                      },
                      controller: costController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Xonadonni narxini kiriting / oyiga",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  left:
                                      BorderSide(color: Colors.grey.shade300))),
                          padding: EdgeInsets.only(left: 8.w, top: 0),
                          width: 70,
                          height: 0,
                          child: DropdownButton(
                            underline: Container(),
                            value: _dropownUsd,
                            onChanged: (String? e) {
                              setState(() {
                                
                                _dropownUsd = e;
                              });
                            },
                            hint: Text(
                              "SO'M",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  "SO'M",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textColor),
                                ),
                                value: "sum",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "USD",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textColor),
                                ),
                                value: "usd",
                              )
                            ],
                          ),
                        ),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: _checkMetro,
                        onChanged: (e) {
                          setState(() {
                            _checkMetro = e!;
                            if (_checkMetro == true) {
                              Subway = '1';
                            } else {
                              Subway = '2';
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text("Metroga yaqin")
                  ],
                ),
                SizedBox(height: 22.h),
                Text(
                  "Qo’shimcha",
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sheriklarni tanlang",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorGender),),
                          child: DropdownButtonFormField(
                            hint: Text("Qiz,O'g'il"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: gender.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                GenderOnClick =true;
                                genderString = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Soni",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),border: Border.all(color: colorCountPupil),),
                          child: DropdownButtonFormField(
                            hint: Text("Ijarachilar soni"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Colors.grey),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: ijarachi.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                CountPupilOnClick = true;
                                countRoom = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "E’lonni nomlash",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorForm),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onSaved: (e){
                        if(e!.length>0){
                          setState(() {
                            FormOnClick = true;
                          });
                        }
                      },
                      controller: adsTitleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E’lonni nomlang",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Qo’shimcha ma’lumot ",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorFormDescription),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      onSaved: (e){
                        if(e!.length>0){
                          setState(() {
                            FormDescriptionOnClick = true;
                          });
                        }
                      },
                      controller:inputcontroller ,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Massage...',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
                  child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            primary: AppColors.buttonLinear),
                        onPressed: () {
                          print(Hive.box('token').get('token'));
                          // print(RoomOwner);
                          // print(TypeHouse=='Kvartira'? '1':'2');
                          // print(CountRoom);
                          // print(RentOf == 'kunlik'? '1':'2');
                          // print(costController?.text);//
                          // print(_dropownUsd == "SO'M"? '1':'2');
                          // print(Subway);
                          // print(genderString == 'Erkak'? '1':'2');
                          // print(adsTitleController?.text);//
                          // print(inputcontroller?.text);//
                          // print(addressController?.text);//
                          CreateAdsUserServeice().CreateAds(
                              districtId: data.districtOwnerId,
                              roomOwner: RoomOwner,
                              TypeHouse: TypeHouse=='Kvartira'? '1':'2',
                              CountRoom: CountRoom,
                              TypeOfRent: RentOf == 'kunlik'? '1':'2',
                              cost: costController?.text,
                              typePayment: _dropownUsd == "SO'M"? '1':'2',
                              subway: Subway,
                              gender: genderString == 'Erkak'? '1':'2',
                              countRoom: countRoom,
                              title: adsTitleController?.text,
                              description: inputcontroller?.text,
                              address: addressController?.text
                          );

                          if (RegionOnClick &&
                              DiscritOnClick &&
                              UniverOnClick &&
                              TypeHouseOnClick &&
                              RoomCountOnClick &&
                              RentTypeOnClick &&
                              TypeCostOnClick &&
                              GenderOnClick &&
                              CountPupilOnClick &&
                               FormOnClick   &&
                              FormDescriptionOnClick

                          ) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()),
                                (route) => false);
                          } else {
                            setState(() {
                              colorRegion = Colors.red;
                              colorDistric = Colors.red;
                              colorUniver = Colors.red;
                              colorTypeHouse = Colors.red;
                              colorRoomCount = Colors.red;
                              colorRentType = Colors.red;
                              colorTypeCost = Colors.red;
                              colorGender = Colors.red;
                              colorCountPupil = Colors.red;
                              colorForm = Colors.red;
                              colorFormDescription = Colors.red;
                            });
                          }
                        },
                        child: Text(
                          "E’lon saqlash",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
