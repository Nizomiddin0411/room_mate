import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/update_students2.dart';
import '../../core/const/app_colors.dart';
import '../../cubit/aut_cubit.dart';
import '../../provider/region_provider.dart';

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
  String? districtId;
  String? inFloor;
  List<dynamic>? images;
  String? updateid;
  String? stay_univer_id;

  StudentsEdist(
      {Key? key,
        required this.inFloor,
        required this.districtId,
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
      required this.howcountroom})
      : super(key: key);

  @override
  State<StudentsEdist> createState() => _StudentsEdistState();
}

class _StudentsEdistState extends State<StudentsEdist> {
  GlobalKey _keyAddInfo = GlobalKey();
  String? partner;
  String dropDown = "";
  String dropDown2 = "";
  String? _titleGendor;
  String Regionidisi = "";
  String UniverId = '';
  Color titlecolor = Colors.grey;
  bool _otmOnClick = false;
  bool titlecolor2 = false;
  Color _colorUniver = Colors.grey;
  Color _colorGender = Colors.grey;
  Color _colorForm = Colors.grey;
  bool gender1 = false;
  Color _phoneColor = Colors.grey;

  var kvsherik = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final List<String> genderItems = ["O'g'il bola", "Qiz bola"];

  bool regionsvalue = false;
  bool numbervalue = false;
  String? univervalue;
  bool value6 = false;

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
    super.initState();
    titlecontroller1 = TextEditingController(text: widget.title);
    phoneController = TextEditingController(text: widget.phone_number);
    addinformation = TextEditingController(text: widget.description);
    dropDown = widget.stay_region.toString();

    Regionidisi = widget.stay_region_id.toString();
    if (widget.roommate_gender.toString() == '2') {
      _titleGendor = "2";
    } else {
      _titleGendor = "1";
    }
    partner = widget.roommate_count;
    roommate_gender = widget.roommate_gender == ''
        ? "O’gil bollarga / Qizlarga"
        : widget.roommate_gender == '2'
            ? 'Qiz '
            : "O'g'il";
    if (widget.stay_university_matter == '2') {
      value6 = true;
      univervalue = '2';
    } else {
      value6 = false;
      univervalue = '1';
    }
    if (widget.stay_region_matter == '1') {
      regionsvalue = true;
    } else {
      regionsvalue = false;
    }
    if (widget.phone_number_show == '1') {
      numbervalue = true;
    } else {
      numbervalue = false;
    }
    if (widget.have_living_home == '1') {
      house = '1';
    } else {
      house = '2';
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Consumer<RegionProvider>(
          builder: (_, data, __) {
            data.UniverId = widget.stay_univer_id.toString();
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
                    padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (e) {
                        setState(() {
                          if (e.isNotEmpty) {
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
                        hintStyle:
                            TextStyle(fontSize: 12.sp, color: Colors.grey),
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
                    Text(
                      "Qaysi viloyatlik sherik izlayabsiz ?".tr(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 76.w,
                    ),
                    Text(
                      "Ahamiyatsiz",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 240.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.textColor)),
                      child: IgnorePointer(
                        ignoring: regionsvalue,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          menuMaxHeight: 100.h,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child:  Text(widget.stay_region.toString()).tr(),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          // value: ,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          items: data.regions.map((e) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                data.RegionId = e.id.toString();
                              },
                              value: e.name ?? "",
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.w),
                                child: Text(e.name.toString()),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) async {
                            setState(() {
                              dropDown = newValue.toString();
                              print( data.RegionId + 'dsdsdsdsdsd');
                            });
                          },
                        ),
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Text(
                      "Ahamiyatsiz",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
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
                        enabled: !value6,
                        dropdownBuilder: _style,
                        mode: Mode.BOTTOM_SHEET,
                        items: data.univer.map((e) {
                          if (dropDown2 == e.name) {
                            // data.UniversiterId = e.id.toString();
                            data.isId = e.id;
                            UniverId = e.id.toString();
                          }
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
                          // final selected = data.univer
                          //     .where((element) => element.name == value);
                          // data.getFaculty(selected.last.id!);
                          // data.getFaculty(data.isId!);
                          // print('${selected}=================');

                          setState(() {
                            dropDown2 = value.toString();
                            _colorUniver = Colors.grey;
                          });
                        },
                        selectedItem: tr(value6 == false ?  widget.universtatenewname.toString():''),
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
                              value6 = value!;
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
                  height: 7.h,
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
                        SizedBox(height: 7.h),
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
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: genderItems.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  e == "Qiz bola" ? _titleGendor = '2' : '1';
                                },
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (gender) {
                              setState(() {
                                widget.roommate_gender.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nechta sherik izlayabsiz ?".tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: 152.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: _colorGender)),
                          child: DropdownButtonFormField(
                            menuMaxHeight: 100,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.roommate_count.toString(),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: kvsherik.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  partner = e;
                                },
                                value: e,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {});
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
                        Text(
                          "Telefon raqami",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ).tr(),
                        SizedBox(
                          width: 162.w,
                        ),
                        Text(
                          "Ko’rinmasin",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                                } else {
                                  _phoneColor = Colors.red;
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
                              height: 3.h,
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
                              style: TextStyle(fontSize: 17.sp),
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
                              style: TextStyle(
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
                    fontSize: 12.sp,
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
                          if (e.isNotEmpty) {
                            _colorForm = Colors.grey;
                          } else {
                            _colorForm = Colors.red;
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
                            TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      cursorColor: Colors.grey.shade800,
                      cursorWidth: 1.5.w,
                    ),
                  ),
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
                        print(titlecontroller1!.text + 'title');
                        print(data.RegionId.toString() + 'region');
                        print(regionsvalue == true ? '1':'2' +' region matter');
                        print(data.UniverId + 'univer id');
                        print(univervalue.toString() + 'uniever matter');
                        print(_titleGendor.toString() + 'gender');
                        print(partner.toString() + 'count of roomates');
                        print(phoneController!.text + 'phone number');
                        print(numbervalue == true ? '1':'2' +' hide phone');
                        print(house + 'have live');
                        print(addinformation!.text + 'description');

                        // print('${widget.updateid} id =====');
                        // print('${widget.comfort} comford');
                        // print("${widget.utility_bills}  utility bills");
                        // print(titlecontroller1!.text + 'title');
                        // print(widget.stay_region.toString() + 'region');
                        // print(data.UniverId + 'univer id');
                        // print("${widget.live_with_owner} have live");
                        // print("${widget.cost_period} cost period");
                        // print('${widget.renttype} rent type');
                        // print('${widget.cost_type} cost type');
                        // print('${widget.cost} cost');
                        // print('${widget.floors_count} floor count');
                        // print('${widget.room_count} in floor');
                        // print("${widget.roommate_count} count of room");
                        // print('${widget.house_type} house type');
                        // print('${widget.subway} subway');
                        // print('${widget.address} address');
                        // print('${value6 ? 1 : 2} gender');
                        // print(data.viloyatid.toString() + 'viloyat idsi');
                        // print('${regionsvalue ? 1 : 2} region matter');
                        //
                        // print('${gender1 ? 0 : _titleGendor} gender title');
                        // print( '${gender1 ? 0 : _titleCount}  count of roomates');
                        // print(phoneController!.text.split(' ').join('') + "phone number");
                        // print(house + 'have a home?');
                        // print(addinformation!.text + 'other information');
                        // print('${numbervalue ? 1 : 2} number matter');
                        // print('${widget.district} district id');
                        // print('${widget.location} locations ');

                        // if (titlecolor2 &&
                        //     univerColor &&
                        //     _phoneOnClick &&
                        //     _FormOnClick &&
                        //     _UniverOnClick) {
                        //=====
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudensEdits2(
                              titlecontroller1: titlecontroller1!.text,
                              viloyatidisi:  data.RegionId.toString(),
                              viloyatvalue: regionsvalue ? '1' : '2',
                              universiteteid: data.UniverId,
                              univervalue: '${value6 ? 1 : 2}',
                              titleGendor: '${_titleGendor}',
                              titlecount: '${partner}',
                              phoneController:
                              phoneController!.text.split(' ').join(''),
                              numbervalue: '${numbervalue ? 1 : 2}',
                              house: house,
                              addinformation: addinformation!.text,

                              updateidi: '${widget.updateid}',
                              images: widget.images,
                              comfort: '${widget.comfort}',
                              utility_bills: "${widget.utility_bills}",
                              live_with_owner: "${widget.live_with_owner}",
                              cost_period: "${widget.cost_period}",
                              rent_type: '${widget.renttype}',
                              costtype: '${widget.cost_type}',
                              cost: '${widget.cost}',
                              etaj: '${widget.inFloor}',
                              qavatlar: '${widget.floors_count}',
                              honasoni: "${widget.roommate_count}",
                              housetype: '${widget.house_type}',
                              Subway: '${widget.subway}',
                              adress: '${widget.address}',
                              viloyatname: widget.stay_region.toString(),
                              tuman: '${widget.district}',
                              locations: '${widget.location}', districtId: widget.districtId, roomCount: widget.room_count,
                            ),
                          ),
                        );

                        //===
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
                        print(
                            '${data.UniverId.toString()} UniverId UniverId +++++++++++');
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

  Widget _style(BuildContext context, String? selectedItem) {
    return Text(
      selectedItem!,
      style: TextStyle(fontSize: 12.sp),
    );
  }
}
