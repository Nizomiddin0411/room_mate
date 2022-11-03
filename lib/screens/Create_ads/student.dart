import 'dart:math';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../models/lang_model.dart';
import '../../provider/region_provider.dart';
import 'ads_student_create,dart.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  GlobalKey _keyAddInfo = GlobalKey();
  String dropDown = "";
  String dropDown2 = "";
  String? phonenumber;
  String? addInfo;
  String? _titleGendor;
  String? _titleCount;
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
  Color titlecolor = Colors.grey;
  bool univerColor = false;
  bool _otmOnClick = false;
  bool titlecolor1 = false;
  bool titlecolor2 = false;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = false;
  Color _colorGender = Colors.grey;
  Color _colorForm = Colors.grey;
  Color titlecolort = Colors.grey;
  bool _FormOnClick = false;
  bool gender1 = false;
  bool _phoneOnClick = false;
  Color _phoneColor = Colors.grey;
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
    "O'g'il",
    "Qiz",
  ];
  var kvsherik = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  bool otmEnable = true;
  bool otmEnable1 = false;
  bool region = true;
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
  final phoneController = TextEditingController(text: "+9989");
  final titlecontroller1 = TextEditingController();
  final addinformation = TextEditingController();
  bool regionsvalue = false;
  bool numbervalue = false;
  String? univervalue;
  bool value6 = false;
  Color _otmColor = Colors.grey;

  int house1 = 0;
  var house = '1';
  Color titleColor = Colors.black;
  Color viloyatColor = Colors.black12;
  Color numberColor = Colors.black12;
  Color nameColor = Colors.black12;
  Color numbercolor = Colors.black12;
  Color tumanColor = Colors.black12;
  Color descriction = Colors.black12;
  Color univerColor1 = Colors.black12;

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
                Text(
                  "E’lonni nomlash".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 320.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: titleColor),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            titleColor = Colors.grey;
                            titlecolor2 = true;
                          } else {
                            titleColor = Colors.red;
                            titlecolor2 = false;
                          }
                        });
                      },
                      controller: titlecontroller1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E’lonni nomlang".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey,
                      cursorWidth: 1.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.w,
                ),
                Row(
                  children: [
                    Text(
                      "Qaysi viloyatlik sherik izlayabsiz ?".tr(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Container(
                      width: 240.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: titlecolor)),
                      child: IgnorePointer(
                        ignoring: otmEnable1,
                        child: DropdownButtonFormField(
                          hint: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              "Viloyat/Shaharni tanlang",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
                            ),
                          ),
                          decoration: InputDecoration(border: InputBorder.none),
                          // value: ,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          items: data.regions.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                data.viloyatid = e.id.toString();
                              },
                              value: e.name ?? "",
                              child: Text(e.name.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              univerColor = true;
                              univerColor1 = Colors.grey;
                            });

                            final selected = data.regions
                                .where((element) => element.name == newValue);
                            data.getDistrict(selected.last.id!);
                            setState(() {
                              dropDown = newValue.toString();
                            });
                            print(dropDown + "viloyat adiii");
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox(
                          value: regionsvalue,
                          onChanged: (bool? value) {
                            setState(() {
                              otmEnable1 = value!;
                              regionsvalue = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      "Qaysi OTM da o’qiydigan sherik izlayabsiz ?".tr(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Container(
                      width: 240.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: _colorUniver)),
                      child: DropdownSearch<String>(
                        dropdownBuilder: _style,

                        mode: Mode.BOTTOM_SHEET,
                        enabled: otmEnable,
                        dropdownSearchDecoration:
                            const InputDecoration(border: InputBorder.none),

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
                      width: 9.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox(
                          value: value6,
                          onChanged: (bool? value) {
                            setState(() {
                              otmEnable = value6;
                              value6 = value!;
                              univervalue = value ? '1' : '2';
                              if (value) {
                                _otmColor = Colors.grey.shade900;
                              }
                              if (value) {
                                univerColor1 = Colors.grey;
                              }
                              if (!value && !_otmOnClick) {
                                univerColor1 = Colors.red;
                                _otmOnClick = false;
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
                SizedBox(
                  height: 8.h,
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
                        SizedBox(height: 8.h),
                        Container(
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (gender) {
                              setState(() {
                                if (gender1 == false) {
                                  _titleGendor = e == "Qiz bolaga" ? '2' : '1';
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
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
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            menuMaxHeight: 100,
                            hint: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                "1 - 5".tr(),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _titleCount = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Telefon raqami",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ).tr(),
                        SizedBox(
                          width: 180.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          height: 55.h,
                          width: 240.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: _phoneColor)),
                          child: TextFormField(
                            scrollPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            onChanged: (e) {
                              setState(() {
                                if (e.length > 12) {
                                  _phoneColor = Colors.grey;
                                  _phoneOnClick = true;
                                } else {
                                  _phoneColor = Colors.red;
                                  _phoneOnClick = false;
                                }
                              });
                            },
                            inputFormatters: [
                              TextInputMask(
                                mask: '\\+ 999 99 999 99 99',
                                placeholder: '_ ',
                              )
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Telefon raqamini kiriting".tr(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "Ko’rinmasin",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Checkbox(
                              value: numbervalue,
                              onChanged: (bool? value) {
                                setState(() {
                                  numbervalue = value!;
                                  // _phoneOnClick = true;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ijaraga turishga joyingiz bormi ?",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
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
                              groupValue: house,
                              onChanged: (String? val) {
                                setState(() {
                                  house = val!;
                                  print(house);
                                });
                              },
                            ),
                            Text(
                              'Ha',
                              style: new TextStyle(fontSize: 17.0.sp),
                            ),
                            SizedBox(
                              width: 55.w,
                            ),
                            Radio(
                              value: '2',
                              groupValue: house,
                              onChanged: (String? val) {
                                setState(() {
                                  house = val!;
                                  print(house);
                                });
                              },
                            ),
                            Text(
                              "Yo'q",
                              style:  TextStyle(
                                fontSize: 17.0.sp,
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
                      border: Border.all(color: _colorForm),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    child: TextField(
                      onChanged: (e) {
                        setState(() {});
                      },
                      key: _keyAddInfo,
                      controller: addinformation,
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
                      onPressed: () {
                        print(titlecontroller1.text+'_______________________');
                        print('${value6 ? 1 : 2}'+ 'univer matter');
                        print( data.viloyatid.toString() + 'distrik id');
                        print('${regionsvalue ? 1 : 2}'+'region matter');
                        print( data.UniverId.toString() + 'univer id' );
                        print('${gender1 ? 0 : _titleGendor}' + 'gendr');
                        print('${gender1 ? 0 : _titleCount}' + 'xonadoshlar soni');
                        print(phoneController.text.split(' ').join('').toString() + 'telefon');
                        print(house.toString() + 'have living home');
                        print('${addinformation.text}' + 'discription');
                        print('${numbervalue ? 1 : 2}========== phone matter');
                        if (titlecolor2 &&  _phoneOnClick) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Student2(
                                  titlecontroller1: titlecontroller1.text,
                                  univervalue: '${value6 ? 1 : 2}',
                                  viloyatidisi: data.viloyatid.toString(),
                                  viloyatvalue: '${regionsvalue ? 1 : 2}',
                                  universiteteid: data.UniverId,
                                  titleGendor: '${gender1 ? 0 : _titleGendor}',
                                  titlecount: '${gender1 ? 0 : _titleCount}',
                                  phoneController:
                                      phoneController.text.split(' ').join(''),
                                  house: house,
                                  addinformation: '${addinformation.text}',
                                  numbervalue: '${numbervalue ? 1 : 2}'),
                            ),
                          );
                        } else {
                          // if (!titlecolor2) {
                          //   titlecolor = Colors.red;
                          // // }
                          // if (!univerColor) {
                          //   univerColor1 = Colors.red;
                          // }
                          // if (!_phoneOnClick) {
                          //   _phoneColor = Colors.red;
                          // }

                          // if (!_UniverOnClick) {
                          //   _colorUniver = Colors.red;
                          // }
                          setState(() {});
                        }
                        print(
                            '${titlecontroller1.text} elonni nomlashhhh yooo+++++++++++');
                        print(
                            '${value6 ? '1' : '2'} univervalue shartemas -----');
                        print('${data.viloyatid} viloyatid +++++++++++');
                        print(
                            '${regionsvalue ? '1' : '2'} regionsvalue shart emas ');
                        print('${data.UniverId} UniverId idisi +++++++++++');
                        print(
                            '${_titleGendor.toString() == 'Erkak' ? '1' : '2'} kimlarga++++++');
                        print(
                            '${phoneController.text} telefon raqam   +++++++++++');
                        print(
                            '${house} telefon raqam  sherik vsdjvnsijvbs +++++++++++');
                        print(
                            '${addinformation.text} qoshimcha malumotlar   +++++++++++');
                        print('${_titleCount} nechta odamga +++');
                        print(
                            '${numbervalue ? '1' : '2'}  telefon raqam korinsin  +++++++++++');
                      },
                      child: Text(
                        "Keyingi ".tr(),
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _style(BuildContext context, String? selectedItem) {
    return Text(
      selectedItem!,
      style: TextStyle(fontSize: 14.sp),
    );
  }
}
