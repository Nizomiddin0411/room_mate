import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/cubit/aut_cubit.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Create_ads/Owner_continue_Ads.dart';
import '../../models/get_district_model.dart';
import '../../provider/favorite_provider.dart';
import '../Google_map/map_screen.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  String RoomOwner = '';
  String RentOf = '';
  String Subway = '';
  String dropDown = "";
  String TypeHouse = '';
  String CountRoom = '';
  String genderString = '';
  String dropDown2 = "";
  String countRoom = '';
  TextEditingController? titleController;
  TextEditingController? addressController;
  String? roommate_gender;
  String? gender_matter = '2';
  String? district_id;
  String? university_id;
  String? university_id_matter;
  GetDistrictModel? dropDown1;
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  bool _DiscritOnClick = false;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = false;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = false;
  Color _addressColor = Colors.grey;
  bool _addressOnClick = false;
  Color _otmColor = Colors.grey;
  bool _otmOnClick = false;
  bool value5 = false;
  bool value7 = false;
  bool otmEnable = true;
  bool genderEnable = true;

  var gender = [
    "O'g'il bolaga",
    'Qiz bolaga',
  ];

  @override
  void initState() {
    addressController = TextEditingController();
    titleController = TextEditingController();
    super.initState();
  }

  var id = '1';
  int id2 = 2;
  int id3 = 3;
  int id4 = 4;
  int id5 = 5;
  int idhouse = 6;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value6 = false;

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
                  "E???lonni nomlash".tr(),
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
                      border: Border.all(color: _colorUniver),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 9.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            setState(() {
                              _UniverOnClick = true;
                              _colorUniver = Colors.grey;
                            });
                          } else {
                            setState(() {
                              _UniverOnClick = false;
                              _colorUniver = Colors.red;
                            });
                          }
                        });
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E???lonni nomlang".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ijaraga beraman".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 225.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "O???gil bollarga / Qizlarga".tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.grey,
                            ),
                            items: gender.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  setState(() {
                                    if (value5 == false) {
                                      roommate_gender =
                                          e == "Qiz bolaga".tr() ? '2' : '1';
                                    }
                                  });
                                },
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: genderEnable
                                ? (newValue) {
                                    setState(() {
                                      _GenderOnClick = true;
                                      _colorGender = Colors.grey;
                                    });
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz".tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox(
                          value: value5,
                          onChanged: (bool? value) {
                            setState(() {
                              value5 = value!;
                              gender_matter = value ? '1' : '2';

                              if (value) {
                                _colorGender = Colors.grey.shade300;
                                genderEnable = false;
                              }
                              if (!value) {
                                value5 = false;
                                genderEnable = true;
                                _colorGender = Colors.red;
                                _GenderOnClick = false;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text("Viloyat".tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                  width: 324.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: _colorRegion),
                  ),
                  child: DropdownButtonFormField(
                    menuMaxHeight: 100.h,
                    hint: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text(
                        "Viloyatni tanlang".tr(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    // value: ,
                    icon: const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    items: data.regions.map((e) {
                      return DropdownMenuItem<String>(
                        value: context.read<AutCubit>().selectedLang.index ==
                            1 ? e.name.toString() :e.nameRu.toString(),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(context.read<AutCubit>().selectedLang.index ==
                              1 ? e.name.toString():e.nameRu.toString()),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      if(context.read<AutCubit>().selectedLang.index ==
                          1) {
                        final selected = data.regions
                            .where((element) => element.name == newValue);
                        data.getDistrict(selected.last.id!);
                      }else{
                        final selected = data.regions
                            .where((element) => element.nameRu == newValue);
                        data.getDistrict(selected.last.id!);
                      }
                      setState(() {
                        _RegionOnClick = true;
                        _colorRegion = Colors.grey;
                        dropDown = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Tuman".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                _RegionOnClick
                    ? Container(
                        width: 324.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: _colorDistric),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: DropdownButtonFormField(
                          menuMaxHeight: 100.h,
                          isExpanded: true,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "Tumanni tanlang".tr(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          items: data.districts.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                data.districtOwnerId = e.id.toString();

                                district_id = e.id.toString();
                                setState(() {});
                              },
                              value:context.read<AutCubit>().selectedLang.index ==
                                  1
                                  ? e.name.toString()
                                  : e.nameRu.toString(),
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(context.read<AutCubit>().selectedLang.index ==
                                    1
                                    ? e.name.toString()
                                    : e.nameRu.toString()),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            _DiscritOnClick = true;
                            _colorDistric = Colors.grey;

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
                            border: Border.all(color: _colorDistric),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Tumanni tanlang".tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: const [],
                            onChanged: null),
                      ),
                SizedBox(height: 12.h),
                Text(
                  "Manzil".tr(),
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
                      border: Border.all(color: _addressColor),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            setState(() {
                              _addressOnClick = true;
                              _addressColor = Colors.grey;
                            });
                          } else {
                            setState(() {
                              _addressOnClick = false;
                              _addressColor = Colors.red;
                            });
                          }
                        });
                      },
                      controller: addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kvartal , Uy , Xonadon".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MapScreen()));
                    },
                    child: SizedBox(
                      width: 324.w,
                      height: 60.h,
                      child: Card(
                        shadowColor: AppColors.buttonLinear,
                        child: ListTile(
                          title: Text(
                            "Geojoylashishni kiriting".tr(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ).tr(),
                          leading: const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    )
                    // Container(
                    //   width: 324.w,
                    //   height: 210.h,
                    //   child: SafeArea(
                    //     // on below line creating google maps
                    //     child: GoogleMap(
                    //       onTap: _handlerTap,
                    //       zoomControlsEnabled: false,
                    //
                    //       myLocationButtonEnabled: false,
                    //       // on below line setting camera position
                    //       // initialCameraPosition: _kGoogle,
                    //       initialCameraPosition: const CameraPosition(
                    //         target: LatLng(41.311081,69.240562),
                    //         zoom: 14,
                    //
                    //       ),
                    //       markers: Set.from(mymarker),
                    //       // on below line we are setting markers on the map
                    //       // markers: Set<Marker>.of(_markers),
                    //       // on below line specifying map type.
                    //       mapType: MapType.normal,
                    //       // on below line setting user location enabled.
                    //       myLocationEnabled: true,
                    //       // on below line setting compass enabled.
                    //       compassEnabled: true,
                    //       // on below line specifying controller on map complete.
                    //       onMapCreated: (GoogleMapController controller){
                    //         _controller.complete(controller);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    ),
                SizedBox(
                  height: 18.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Metroga yaqinmi ?".tr(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: '1',
                              groupValue: id,
                              onChanged: (String? val) {
                                setState(() {
                                  id = val!;
                                  print(id);
                                });
                              },
                            ),
                            Text(
                              'Ha'.tr(),
                              style: TextStyle(fontSize: 14.0.sp),
                            ),
                            SizedBox(
                              width: 55.w,
                            ),
                            Radio(
                              value: '2',
                              groupValue: id,
                              onChanged: (String? val) {
                                setState(() {
                                  id = val!;
                                  print(id);
                                });
                              },
                            ),
                            Text(
                              "Yo'q".tr(),
                              style: TextStyle(
                                fontSize: 14.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "OTM ga yaqinmi ?".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                // Container(
                //   width: 324.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.r),
                //       border: Border.all(color: _colorUniver)),
                //   child: DropdownButtonFormField(
                //     isExpanded: true,
                //     hint: Padding(
                //       padding: EdgeInsets.only(left: 8.w),
                //       child: Text("OTM ni tanlang".tr()),
                //     ),
                //     decoration: InputDecoration(border: InputBorder.none),
                //     // value: ,
                //     icon: Icon(Icons.arrow_drop_down_outlined),
                //     items: data.univer.map((e) {
                //       return DropdownMenuItem<String>(
                //         onTap: () {
                //           data.UniverId = e.id.toString();
                //         },
                //         value: e.name ?? "",
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width - 150.w,
                //           child: Padding(
                //             padding: EdgeInsets.only(left: 8.w),
                //             child: Text(e.name.toString()),
                //           ),
                //         ),
                //       );
                //     }).toList(),
                //     onChanged: (newValue) async {
                //       // print("Selected ----------- $newValue");
                //       setState(() {
                //         _UniverOnClick = true;
                //         _colorUniver = Colors.grey;
                //       });
                //       final selected = data.univer
                //           .where((element) => element.name == newValue);
                //       data.getFaculty(selected.last.id!);
                //       setState(() {
                //         dropDown2 = newValue.toString();
                //       });
                //     },
                //   ),
                // ),
                Row(
                  children: [
                    otmEnable == true
                        ? Container(
                            width: 240.w,
                            padding: EdgeInsets.only(left: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _otmColor),
                            ),
                            child: DropdownSearch<String>(
                              dropdownBuilder: _style,
                              enabled: otmEnable,
                              selectedItem: tr("OTM ni tanlang"),
                              dropdownSearchDecoration: const InputDecoration(
                                  border: InputBorder.none),

                              mode: Mode.BOTTOM_SHEET,
                              items: data.univer.map((e) {
                                if (context
                                        .read<AutCubit>()
                                        .selectedLang
                                        .index ==
                                    1) {
                                  if (dropDown2 == e.name) {
                                    data.UniverId = e.id.toString();
                                    data.isId = e.id;
                                    university_id = e.id.toString();
                                  }
                                } else {
                                  if (dropDown2 == e.nameRu) {
                                    data.UniverId = e.id.toString();
                                    data.isId = e.id;
                                    university_id = e.id.toString();
                                  }
                                }

                                // final selected = data.univer.where((element) => element.name == e.name);
                                // data.getFaculty(selected.last.id!);
                                return context
                                            .read<AutCubit>()
                                            .selectedLang
                                            .index ==
                                        1
                                    ? e.name.toString()
                                    : e.nameRu.toString();
                              }).toList(),
                              showSearchBox: true,
                              // label: "Menu mode",
                              // hint: "country in menu mode",
                              onChanged: (value) async {
                                // data.isUniver = true;
                                // final selected = data.univer
                                //     .where((element) => element.name == value);
                                // data.getFaculty(selected.last.id!);
                                // data.getFaculty(data.isId!);
                                setState(() {
                                  dropDown2 = value.toString();
                                  _otmOnClick = true;
                                  _otmColor = Colors.grey;
                                });
                              },
                            ),
                          )
                        : Container(
                            width: 240.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                hint: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(12.w, 4.h, 0, 5.w),
                                  child: Text(
                                    "OTM ni tanlang".tr(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                icon: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 11.w, 9.w),
                                  child: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                ),
                                items: const [],
                                onChanged: null),
                          ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz".tr(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                          value: value6,
                          onChanged: (bool? value) {
                            setState(() {
                              otmEnable = !value!;
                              value6 = value;
                              university_id_matter = value ? '1' : '2';
                              if (value) {
                                _otmColor = Colors.grey.shade300;
                              }
                              if (!value && !_otmOnClick) {
                                _otmColor = Colors.red;
                                _otmOnClick = false;
                              }
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),

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
                        onPressed: () {
                          final map = context.read<FavoriteProvider>();
                          print(map.forMap.toString() +
                              'MAPPPPPPPPPPPPPPPPPPPPPPP');
                          print('${titleController!.text}  title');
                          print('${value5 ? 0 : roommate_gender}' + 'gender');
                          print('${value5 ? 1 : 2} axamyatsiz gender');
                          print('${district_id} distruqt id');
                          print('${addressController!.text} Address');
                          print('${id} metrooo');
                          print('${value6 ? 0 : university_id} univer id');
                          print('$gender_matter axamyatsiz univer');

                          if (_RegionOnClick &&
                              _DiscritOnClick &&
                              _UniverOnClick &&
                              (_GenderOnClick || gender_matter == '1') &&
                              _addressOnClick &&
                              (_otmOnClick || university_id_matter == '1')) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OwnerHouseInfo(
                                          id: id,
                                          addressController:
                                              addressController!.text,
                                          university_id:
                                              '${value6 ? 0 : university_id}',
                                          roommate_gender:
                                              '${value5 ? 0 : roommate_gender}',
                                          university_id_matter:
                                              '${value6 ? 1 : 2}',
                                          gender_matter: gender_matter,
                                          district_id: district_id,
                                          titleController:
                                              titleController!.text,
                                          location: '${map.forMap}',
                                        )));
                          } else {
                            setState(() {
                              if (!_RegionOnClick) {
                                _colorRegion = Colors.red;
                              }
                              if (!_DiscritOnClick) {
                                _colorDistric = Colors.red;
                              }
                              if (!_UniverOnClick) {
                                _colorUniver = Colors.red;
                              }
                              if (!_GenderOnClick && gender_matter == null) {
                                _colorGender = Colors.red;
                              }
                              if (!_addressOnClick) {
                                _addressColor = Colors.red;
                              }
                              if (!_otmOnClick &&
                                  university_id_matter == null) {
                                _otmColor = Colors.red;
                              }
                            });
                          }
                        },
                        child: Text(
                          "Keyingi".tr(),
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

  Widget _style(BuildContext context, String? selectedItem) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(0,4.w,4.w,0),
      child: Text(
        selectedItem!,
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
