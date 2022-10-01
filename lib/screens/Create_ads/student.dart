import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/menu/menu.dart';
import '../../cubit/aut_cubit.dart';
import '../../models/lang_model.dart';
import '../../provider/region_provider.dart';
import '../../services/post_create_ads_student.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  TextEditingController? costcontroller;
  TextEditingController? titlecontroller;
  TextEditingController? othercontroller;
  String dropDown = "";
  String dropDown2 = "";
  bool _checkHome = false;
  bool _checkMetro = false;
  String? _dropownUsd;
  String _titleTime = "Ijara muddati";
  String _titleGendor = "";
  String _titleCount = "Ijarachilar soni";
  String _titleCourse = "";
  String DistrictId = '';
  String UniverId = '';
  String Course = '';
  String FakultetId = '';
  String RoomOwner = '';
  String TypeHouse = '';
  String TypeOfRent = '';
  String typeOfPayment = '';
  String subwayof = '';
  String gender = '';
  String CourseCount = '';
  String roomCount = '';
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  bool _DiscritOnClick = false;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = false;
  Color _colorFaculty = Colors.grey;
  bool _FacultyOnClick = false;
  Color _colorCourse = Colors.grey;
  bool _CourseOnClick = false;
  Color _colorTypeHouse = Colors.grey;
  bool _TypeHouseOnClick = false;
  Color _colorRoomCount = Colors.grey;
  bool _RoomCountOnClick = false;
  Color _colorRentType = Colors.grey;
  bool _RentTypeOnClick = false;
  Color _colorTypeCost = Colors.grey;
  bool _TypeCostOnClick = false;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = false;
  Color _colorCountPupil = Colors.grey;
  bool _CountPupilOnClick = false;
  Color _colorForm = Colors.grey;
  bool _FormOnClick = false;
  final TextEditingController _textEditingController = TextEditingController();
  var kurs = [
    '1-kurs',
    '2-kurs',
    '3-kurs',
    '4-kurs',
    '5-kurs',
    '6-kurs',
  ];
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var genderone = [
    'Erkak',
    'Ayol',
  ];
  var kvsherik = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'Ayol',
  ];
  final List<String> genderItems = ["O'g'il bola ", "Qiz bola"];
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
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value5 = false;
  int id = 1;

  @override
  void initState() {
    super.initState();
    costcontroller = TextEditingController();
    titlecontroller = TextEditingController();
    othercontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AutCubit>().selectSettingLan(
        LangData.languageList.singleWhere((e) => e.locale == context.locale),
        context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Consumer<RegionProvider>(
          builder: (_, data, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E’lonni nomlash"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text("E’lonni nomlang"),
                      labelStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Qaysi viloyatlik sherik izlayabsiz ?".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Container(
                      width: 245.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: _colorRegion)),
                      child: DropdownButtonFormField(
                        hint: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text("Viloyat/shaharni tanlang".tr()),
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                        // value: ,
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: data.regions.map((e) {
                          return DropdownMenuItem<String>(
                            value: e.name ?? "",
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(e.name.toString()),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          setState(() {
                            _RegionOnClick = true;
                            _colorRegion = Colors.grey;
                          });

                          final selected = data.regions
                              .where((element) => element.name == newValue);
                          data.getDistrict(selected.last.id!);
                          setState(() {
                            dropDown = newValue.toString();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Column(
                      children: [
                        Text("Ahamiyatsiz"),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "Qaysi OTM da o’qiydigan sherik izlayabsiz ?".tr(),
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
                    Container(
                      width: 250.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: _colorUniver)),
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        items: data.univer.map((e) {
                          if (dropDown2 == e.name) {
                            data.UniverId = e.id.toString();
                            data.isId = e.id;
                          }

                          // final selected = data.univer.where((element) => element.name == e.name);
                          // data.getFaculty(selected.last.id!);
                          return context.read<AutCubit>().selectedLang.index ==
                                  1
                              ? e.name.toString()
                              : e.nameRu.toString();
                        }).toList(),
                        showSearchBox: true,
                        // label: "Menu mode",
                        // hint: "country in menu mode",
                        onChanged: (value) async {
                          data.isUniver = true;
                          final selected = data.univer
                              .where((element) => element.name == value);
                          data.getFaculty(selected.last.id!);
                          // data.getFaculty(data.isId!);
                          print('${selected}=================');
                          setState(() {
                            dropDown2 = value.toString();
                            _UniverOnClick = true;
                            _colorUniver = Colors.grey;
                          });
                        },
                        selectedItem: tr("OTM ni tanlang"),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      children: [
                        Text("Ahamiyatsiz"),
                        Checkbox(
                          value: this.value5,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sherik izlayabmiz".tr(),
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
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Qiz,O'g'il".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: genderone.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _GenderOnClick = true;
                                _colorGender = Colors.grey;
                                _titleGendor = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nechta sherik izlayabsiz ?".tr(),
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
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "1 - 10".tr(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: kvsherik.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {},
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _GenderOnClick = true;
                                _colorGender = Colors.grey;
                                _titleGendor = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Telefon raqami").tr(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 240,
                          child: TextFormField(
                            inputFormatters: [
                              TextInputMask(
                                mask: '\\+ 999 99 999 99 99',
                                placeholder: '_ ',
                                maxPlaceHolders: 13,
                              )
                            ],
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.phone,
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "+998 ** *** ** **".tr(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Column(
                          children: [
                            Text("Ko’rinmasin"),
                            Checkbox(
                              value: this.value5,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value5 = value!;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                   Row(children: [
                     Text("Ijaraga turishga joyingiz bormi ?",style: TextStyle(fontSize: 15),),
                   ],),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {
                                  id = 1;
                                });
                              },
                            ),
                            Text(
                              'Ha',
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(width: 55,),
                            Radio(
                              value: 2,
                              groupValue: id,
                              onChanged: (val) {
                                setState(() {

                                  id = 2;
                                });
                              },
                            ),
                            Text(
                              "Yo'q",
                              style: new TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )

                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  "Qo’shimcha xususiyatlarni kiriting ".tr(),
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
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextFormField(
                      controller: othercontroller,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Message...'.tr(),
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
                        onPressed: () async {
                          setState(() {
                            if (_titleCourse == '1-kurs' ||
                                _titleCourse == '1-курс') {
                              Course = '1';
                            } else if (_titleCourse == '2-kurs' ||
                                _titleCourse == '2-курс') {
                              Course = '2';
                            } else if (_titleCourse == '3-kurs' ||
                                _titleCourse == '3-курс') {
                              Course = '3';
                            } else if (_titleCourse == '4-kurs' ||
                                _titleCourse == '4-курс') {
                              Course = '4';
                            } else if (_titleCourse == '5-kurs' ||
                                _titleCourse == '5-курс') {
                              Course = '5';
                            } else if (_titleCourse == '6-kurs' ||
                                _titleCourse == '6-курс') {
                              Course = '6';
                            }
                          });
                          setState(() {
                            if (kvartira == 'Xovli' || kvartira == 'Участка') {
                              TypeHouse = '2';
                            } else {
                              TypeHouse = '1';
                            }
                          });
                          setState(() {
                            if (TypeOfRent == 'kunlik' ||
                                TypeOfRent == 'день') {
                              _titleTime = '1';
                            } else {
                              _titleTime = '2';
                            }
                          });
                          setState(() {
                            if (_checkMetro == true) {
                              subwayof = '1';
                            } else {
                              subwayof = '2';
                            }
                          });
                          setState(() {
                            if (_titleGendor == 'Ayol' ||
                                _titleGendor == 'Женщина') {
                              gender = '2';
                            } else {
                              gender = '1';
                            }
                          });
                          await CreateAdsStudent().CreateAds(
                            districtId: data.districtId,
                            UniderId: data.UniverId,
                            fakultetId: data.FacutyId,
                            Course: Course,
                            roomOwner: RoomOwner,
                            TypeHouse: TypeHouse,
                            CountRoom: roomCount,
                            TypeOfRent: _titleTime,
                            cost: costcontroller?.text,
                            typePayment: typeOfPayment,
                            subway: subwayof,
                            gender: gender,
                            title: titlecontroller?.text,
                            description: othercontroller?.text,
                          );


                        },
                        child: Text(
                          "Keyingi ".tr(),
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
