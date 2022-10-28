import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../provider/region_provider.dart';
import 'update_students2.dart';
class StudentsEdist extends StatefulWidget {
  String? title;
  String? stay_region;
  String? stay_region_id;
  String? stay_region_matter;
  String? stay_universityname;
  String? stay_university_matter;
  String? roommate_gender;
  String? roommate_count;
  String? phone_number;
  String? phone_number_show;
  String? have_living_home;
  String? description;
  String? district;
  String? address;
  String? location;
  String? subway;
  String? house_type;
  String? room_count;
  String? floors_count;
  String? howcountroom;
  String? cost;
  String? cost_type;
  String? live_with_owner;
  String? utility_bills;
  String? comfort;
  String? renttype;
  String? cost_period;
  String? universtatenewname;
  String? images;
  String? updateid;
  String? stay_univer_id;


   StudentsEdist({Key? key,
     required this.stay_univer_id,
     required this.updateid,
     required this.stay_universityname,
     required this.stay_region_id,
     required this.images,
   required this.title,
   required this.universtatenewname,

   required this.description,

   required this.room_count,
   required this.location,
   required this.subway,
   required this.address,
   required this.cost,
   required this.utility_bills,
   required this.stay_university_matter,
   required this.stay_region_matter,
   required this.stay_region,
   required this.renttype,
     required this.phone_number,
     required this.roommate_gender,
     required this.phone_number_show,
     required this.house_type,
     required this.have_living_home,
     required this.live_with_owner,
     required this.district,
     required this.cost_type,
     required this.comfort,
     required this.cost_period,
     required this.roommate_count,
     required this.floors_count,
     required this.howcountroom


   }) : super(key: key);

  @override
  State<StudentsEdist> createState() => _StudentsEdistState();
}

class _StudentsEdistState extends State<StudentsEdist> {
  GlobalKey _keyAddInfo = GlobalKey();
  String dropDown = "";
  String dropDown2 = "";
  String? phonenumber;
  String? addInfo;
  String? _titleGendor;
  String? _titleCount;
  String Regionidisi = "";
  String UniverId = '';
  String Univername = '';
  String Univernamenew = '';
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

  bool regionsvalue = false;
  bool numbervalue = false;
  String? univervalue;
  bool value6 =false ;


  var house = '0';
  Color titleColor = Colors.black;
  Color viloyatColor = Colors.black12;
  Color numberColor = Colors.black12;
  Color nameColor = Colors.black12;
  Color numbercolor = Colors.black12;
  Color tumanColor = Colors.black12;
  Color descriction = Colors.black12;
  Color univerColor1 = Colors.black12;
  TextEditingController? titlecontroller1;
  TextEditingController? phoneController;
  TextEditingController? addinformation;
  String? roommate_gender;

  @override
  void initState() {
    titlecontroller1 = TextEditingController(
        text: widget.title );
    phoneController = TextEditingController(
        text: widget.phone_number );
    addinformation =
        TextEditingController(text: widget.description);
    roommate_gender = widget.roommate_gender == ''
        ? "O’gil bollarga / Qizlarga"
        : widget.roommate_gender == '2'
        ? 'Qiz '
        : "O'g'il";
    if( widget.stay_university_matter== '2')
    {
      value6= true;
    }else{
      value6=false;
    }
    if( widget.stay_region_matter== '1'){
      regionsvalue= true;
    }else{
      regionsvalue=false;
    }
    if( widget.phone_number_show== '1'){
      numbervalue= true;
    }else{
      numbervalue=false;
    }
    if( widget.utility_bills== '1'){
      house= '1';
    }else{
      house='2';
    }
    super.initState();
  }

  Widget build(BuildContext context) {
 Regionidisi=widget.stay_region_id.toString();
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: titleColor),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.length > 0) {
                            titleColor = Colors.grey;
                            titlecolor2 = true;
                          } else {
                            titleColor = Colors.red;
                            titlecolor2 = true;
                          }
                        });
                      },
                      controller: titlecontroller1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E'lonni nomlash",
                        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
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
                    SizedBox(
                      width: 82.w,
                    ),
                    Text("Ahamiyatsiz", style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 240.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: titlecolor)),
                      child: DropdownButtonFormField(
                        hint: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(widget.stay_region.toString().tr()),
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                        // value: ,
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: data.regions.map((e) {
                          if (widget.district == e.id.toString()) {
                            // region = e.name.toString();

                            setState(() {});
                          }print(widget.district);
                          return DropdownMenuItem<String>(
                            onTap: () {
                              data.viloyatid = e.id.toString();
                            },
                            value: e.name ?? "",
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(e.name.toString()),
                            ),
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
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      children: [
                        Checkbox(
                          value: regionsvalue,
                          onChanged: (bool? value) {
                            setState(() {
                              regionsvalue = value!;
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
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text("Ahamiyatsiz", style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),),
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
                        mode: Mode.BOTTOM_SHEET,
                        items: data.univer.map((e) {
                          if (dropDown2 == e.name) {
                            data.UniversiterId = e.id.toString();
                            data.isId = e.id;
                            UniverId = e.id.toString();
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
                        selectedItem: tr(widget.universtatenewname.toString()),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      children: [
                        Checkbox(
                          value: value6,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value6 = value!;
                              univervalue = value ? '1' : '2';
                              if (value) {
                                univerColor1 = Colors.grey;
                              }
                              if (!value && !_otmOnClick) {
                                univerColor1 = Colors.red;
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
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.roommate_gender == ''
                                    ? "O’gil  / Qiz".tr()
                                    : roommate_gender.toString(),
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
                            onChanged: (gender) {
                              setState(() {widget.roommate_gender.toString();
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
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.roommate_count.toString(),
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
                  height: 12.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Telefon raqami", style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),).tr(),
                        SizedBox(
                          width: 170.w,
                        ),
                        Text("Ko’rinmasin", style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          height: 55.h,
                          width: 247.w,
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
                              hintStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Checkbox(
                              value: numbervalue,
                              onChanged: (bool? value) {
                                setState(() {
                                  numbervalue = value!;
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
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ijaraga turishga joyingiz bormi ?",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16.sp,
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
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(
                              width: 35.w,
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
                              style: new TextStyle(
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
                        setState(() {
                          if (e.length > 0) {
                            _colorForm = Colors.grey;
                            _FormOnClick = true;
                          } else {
                            _colorForm = Colors.red;
                            _FormOnClick = false;
                          }
                        });
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
                        // if (titlecolor2 &&
                        //     univerColor &&
                        //     _phoneOnClick &&
                        //     _FormOnClick &&
                        //     _UniverOnClick) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudensEdits2(
                                updateidi: '${widget.updateid}',
                                images: '${widget.images}',
                                comfort: '${widget.comfort}',
                                utility_bills: "${widget.utility_bills}",
                                live_with_owner: "${widget.live_with_owner}",
                                cost_period: "${widget.cost_period}",
                                rent_type: '${widget.renttype}',
                                costtype: '${widget.cost_type}',
                                cost: '${widget.cost}',
                                etaj: '${widget.floors_count}',
                                qavatlar: '${widget.room_count}',
                                honasoni: "${widget.roommate_count}",
                                housetype: '${widget.house_type}',
                                Subway: '${widget.subway}',
                                adress: '${widget.address}',
                                viloyatname: widget.stay_region.toString(),
                                  titlecontroller1: '${titlecontroller1!.text}',
                                  univervalue: '${value6 ? 1 : 2 }',
                                  viloyatidisi: '${data.viloyatid.toString()}',
                                  viloyatvalue: '${regionsvalue ?1:2}',
                                  universiteteid: '${data.UniverId}',
                                  titleGendor: '${gender1 ? 0 : _titleGendor}',
                                  titlecount: '${gender1 ? 0 : _titleCount}',
                                  phoneController:phoneController!.text.split(' ').join(''),
                                  house: house,
                                  addinformation: '${addinformation!.text}',
                                  numbervalue: '${numbervalue ? 1 : 2}', tuman: '${widget.district}',
                              ),
                            ),
                          );
                        // } else {
                        //   if (!titlecolor2) {
                        //     titlecolor = Colors.red;
                        //   }
                        //   if (!univerColor) {
                        //     univerColor1 = Colors.red;
                        //   }
                        //   if (!_phoneOnClick) {
                        //     _phoneColor = Colors.red;
                        //   }
                        //   if (!_FormOnClick) {
                        //     _colorForm = Colors.red;
                        //   }
                        //   if (!_UniverOnClick) {
                        //     _colorUniver = Colors.red;
                        //   }
                        //   setState(() {});
                        // }
                        // print(
                        //     '${Regionidisi}  yooo+++++++++++');
                        // print(
                        //     '${value6 ? '1' : '2'} univervalue shartemas -----');
                        // print('${data.viloyatid} viloyatid +++++++++++');
                        // print(
                        //     '${regionsvalue ? '1' : '2'} regionsvalue shart emas ');
                        print('${data.UniverId.toString()} UniverId UniverId +++++++++++');
                        // print(
                        //     '${_titleGendor.toString() == 'Erkak' ? '1' : '2'} kimlarga++++++');
                        // print(
                        //     '${phoneController} telefon raqam   +++++++++++');
                        // print(
                        //     '${house} telefon raqam  sherik vsdjvnsijvbs +++++++++++');
                        // print(
                        //     '${addinformation} qoshimcha malumotlar   +++++++++++');
                        // print('${_titleCount} nechta odamga +++');
                        // print(
                        //     '${numbervalue ? '1' : '2'}  telefon raqam korinsin  +++++++++++');
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
}
