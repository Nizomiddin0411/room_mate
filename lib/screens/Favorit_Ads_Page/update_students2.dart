import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/provider/favorite_provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/StudentEdit_post_last%20_page.dart';
import '../../core/const/app_colors.dart';
import '../../provider/region_provider.dart';
import '../Google_map/map_for_edit.dart';

class StudensEdits2 extends StatefulWidget {
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
  String viloyatname;
  String tuman;
  String adress;
  String Subway;
  String housetype;
  String honasoni;
  String qavatlar;
  String etaj;
  String cost;
  String costtype;
  String rent_type;
  String cost_period;
  String live_with_owner;
  String utility_bills;
  String comfort;
  List<dynamic>? images;
  String updateidi;
  String? locations;
  String? districtId;
  String? roomCount;
  StudensEdits2(
      {Key? key,
      required this.roomCount,
      required this.districtId,
      required this.updateidi,
      required this.images,
      required this.comfort,
      required this.utility_bills,
      required this.cost_period,
      required this.live_with_owner,
      required this.costtype,
      required this.rent_type,
      required this.cost,
      required this.etaj,
      required this.honasoni,
      required this.qavatlar,
      required this.univervalue,
      required this.housetype,
      required this.Subway,
      required this.adress,
      required this.tuman,
      required this.viloyatname,
      required this.numbervalue,
      required this.house,
      required this.titlecontroller1,
      required this.viloyatidisi,
      required this.addinformation,
      required this.phoneController,
      required this.titlecount,
      required this.titleGendor,
      required this.universiteteid,
      required this.viloyatvalue,
      required this.locations})
      : super(key: key);

  @override
  State<StudensEdits2> createState() => _StudensEdits2State();
}

class _StudensEdits2State extends State<StudensEdits2> {
  TextEditingController? addressController;

  TextEditingController? costcontroller;
  String dropDown = "";

  String price = '';
  String pricerent_type = '';
  String price1 = '';
  String housetype = '';
  String? _dropownUsd;
  Color _colorRegion = Colors.grey;
  Color _colorDistric = Colors.grey;
  Color _colorGender = Colors.grey;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  List comfort = [];
  bool value6 = false;
  var metro = "0";
  var ownerlive = "0";
  var costcommunal = "0";

  var pricetype = ["Kuniga", "Oyiga", "Kishi boshiga"];

  var housecost = ["Oylik", "Kunlik", "Uzoq muddatga"];

  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var floors_count = [
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
  ];
  var in_floor = [
    '1 ',
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
  ];

  var countroums = [
    "1 ",
    "2",
    "3",
    "4",
    "5 ",
  ];
  Color _costTypeColor = Colors.grey;
  String? housecount;
  String? howcountroom;
  String? housefloorcount;

  String? rent_type;

  String? uyturi;
  String? narxturi;
  String? cost_period1;

  @override
  void initState() {
    super.initState();
    late List<String> haveComfort = widget.comfort.split(',');
    String comfortList = widget.comfort;
    housetype = widget.housetype == '1' ? 'Kvartira' : 'Xovli';
    housecount = widget.roomCount;
    addressController = TextEditingController(text: widget.adress);
    costcontroller = TextEditingController(text: widget.cost);
    housefloorcount = widget.qavatlar.toString();
    howcountroom = widget.etaj;
    if (widget.rent_type == '1') {
      price = '1';
    } else if (widget.rent_type == '2') {
      price = '2';
    } else {
      price = '3';
    }
    if (widget.cost_period == '1') {
      price1 = '1';
    } else if (widget.cost_period == '2') {
      price1 = '2';
    } else {
      price1 = '3';
    }
    for (String i in haveComfort) {
      print(i);
      if (i == '1') {
        value1 = true;
        comfort.add('1');
      }
      if (i == '2') {
        value2 = true;
        comfort.add('2');
      }
      if (i == '3') {
        value3 = true;
        comfort.add('3');
      }
      if (i == '4') {
        value4 = true;
        comfort.add('4');
      }
      if (i == '5') {
        value5 = true;
        comfort.add('5');
      }
      if (i == '6') {
        value6 = true;
        comfort.add('6');
      }
    }

    if (widget.Subway.toString() == '0') {
      metro = '1';
    } else {
      metro = '2';
    }
    if (widget.utility_bills == '1') {
      costcommunal = '1';
    } else {
      costcommunal = '2';
    }
    if (widget.live_with_owner == '1') {
      ownerlive = '1';
    } else {
      ownerlive = '2';
    }
    if (widget.costtype == '1') {
      pricerent_type = '1';
    } else {
      pricerent_type = '2';
    }
    uyturi = widget.housetype == ''
        ? "kv / hovli"
        : widget.housetype == '1'
            ? 'Kv '
            : "Hovli";
    narxturi = widget.rent_type == ''
        ? "kunlik / oylik"
        : widget.housetype == '1'
            ? 'kunlik '
            : "oylik";
    cost_period1 = widget.cost_period == ''
        ? "kunlik / oylik"
        : widget.housetype == ''
            ? 'kunlik '
            : "kishi boshiga";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "E'lon o'zgartirish",
          style: TextStyle(color: AppColors.mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<RegionProvider>(
            builder: (_, data, __) {
              data.districtId = widget.districtId.toString();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Viloyat".tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: 324.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.textColor)),
                    child: DropdownButtonFormField(
                      menuMaxHeight: 100.h,
                      isExpanded: true,
                      hint: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(widget.viloyatname.tr()),
                      ),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
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
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tuman",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  data.isDistrict
                      ? Container(
                          width: 324.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: _colorDistric,
                              ),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(widget.tuman.tr()),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: data.districts.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {
                                  print("${e.name}${e.id}");
                                  data.districtId = e.id.toString();
                                },
                                value: data.isDistrict
                                    ? e.name.toString()
                                    : data.defaultvalue,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(data.isDistrict
                                      ? e.name.toString()
                                      : data.defaultvalue),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _colorDistric = Colors.grey;
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
                              hint: Text(widget.tuman.tr()),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  focusColor: Colors.grey),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: const [],
                              onChanged: null),
                        ),
                  SizedBox(height: 12.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Manzil",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ).tr(),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 55.h,
                            width: 324.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: addressController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "Kvartal , Uy , Xonadon ".tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                      onTap: () {
                        final mapLatitude = context.read<FavoriteProvider>();
                        mapLatitude.locationFor = true;
                        String lat =
                            widget.locations!.split(',').first.toString();
                        String long =
                            widget.locations!.split(',').last.toString();
                        lat = lat.split('(').last.toString();
                        long = long.split(')').first.toString();
                        print(widget.locations);
                        print(lat);
                        print(long);
                        double Lat = double.parse(lat).toDouble();
                        double Long = double.parse(long).toDouble();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapEdit(
                                      location: widget.locations,
                                      long: Long,
                                      lat: Lat,
                                    )));
                      },
                      child: SizedBox(
                        width: 330.w,
                        height: 60.h,
                        child: Card(
                          shadowColor: AppColors.buttonLinear,
                          child: ListTile(
                            title: Text(
                              "Geojoylashishni kiriting",
                              style: TextStyle(fontSize: 14.sp),
                            ).tr(),
                            leading: const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Metroga yaqinmi ?",
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
                                groupValue: metro,
                                onChanged: (String? val) {
                                  setState(() {
                                    metro = val!;
                                    print(metro);
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style: TextStyle(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: metro,
                                onChanged: (String? val) {
                                  setState(() {
                                    metro = val!;
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uy turi".tr(),
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
                                  widget.housetype == ''
                                      ? "kv  / Hovli".tr()
                                      : uyturi.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: kvartira.map((e) {
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
                                  housetype = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                                print(housetype + "house type");
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
                            "Xonalar soni ?".tr(),
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
                              menuMaxHeight: 150,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.honasoni.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: countroums.map((e) {
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
                                  housecount = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
                            "Qavatlar soni ".tr(),
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
                              menuMaxHeight: 150,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.qavatlar.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: floors_count.map((e) {
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
                                  housefloorcount = newValue.toString();
                                  _colorGender = Colors.grey;
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
                            "Nechinchi qavatda ?".tr(),
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
                              menuMaxHeight: 150,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  widget.etaj.tr(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: in_floor.map((e) {
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
                                  howcountroom = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Narxi".tr(),
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: _costTypeColor),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Container(
                      padding: EdgeInsets.only(left: 7.w),
                      child: TextFormField(
                        onChanged: (e) {
                          setState(() {
                            if (e.isNotEmpty) {
                              _costTypeColor = Colors.grey;
                            } else {
                              _costTypeColor = Colors.red;
                            }
                          });
                        },
                        controller: costcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Xonadonni narxini kiriting".tr(),
                          hintStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.grey),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.grey.shade300))),
                            padding: EdgeInsets.only(left: 8.w, top: 0),
                            width: 70.w,
                            height: 0.h,
                            child: DropdownButton(
                              underline: Container(),
                              value: _dropownUsd,
                              onChanged: (String? e) {
                                setState(() {
                                  _dropownUsd = e;
                                  pricerent_type = e == 'sum' ? '1' : '2';
                                  print(pricerent_type);
                                });
                              },
                              hint: Text(
                                "SO'M".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.textColor),
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "SO'M".tr(),
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
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Narxning turlanishi".tr(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            height: 50.h,
                            width: 152.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  '${widget.cost_period}',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: pricetype.map((e) {
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
                                  if (newValue == 'Kuniga') {
                                    price1 = '1';
                                  } else if (newValue == 'Oyiga') {
                                    price1 = '2';
                                  } else {
                                    price1 = '3';
                                  }
                                  print(pricerent_type);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ijara muddatini turi".tr(),
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
                                  widget.rent_type == ''
                                      ? "kunlik  / oylik".tr()
                                      : narxturi.toString(),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: housecost.map((e) {
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
                                  rent_type = newValue.toString();
                                  _colorGender = Colors.grey;
                                  if (newValue == 'Kunlik') {
                                    price = '1';
                                  } else if (newValue == 'Oylik') {
                                    price = '2';
                                  } else {
                                    price = '3';
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Uy egasi ham yashaydimi ?",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                                groupValue: ownerlive,
                                onChanged: (String? val) {
                                  setState(() {
                                    ownerlive = val!;
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style: TextStyle(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: ownerlive,
                                onChanged: (String? val) {
                                  setState(() {
                                    ownerlive = val!;
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kommunal to’lovlarini kim to’laydi ?",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                                groupValue: costcommunal,
                                onChanged: (String? val) {
                                  setState(() {
                                    costcommunal = val!;
                                  });
                                  print(costcommunal);
                                },
                              ),
                              Text(
                                'Uy egasi',
                                style: TextStyle(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Radio(
                                value: '2',
                                groupValue: costcommunal,
                                onChanged: (String? val) {
                                  setState(() {
                                    costcommunal = val!;
                                  });
                                },
                              ),
                              Text(
                                "Ijarachi",
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Quyidagi qulayliklarga ega.",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 170.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Wi - fi "),
                            Checkbox(
                              value: value1,
                              onChanged: (bool? value) {
                                setState(() {
                                  value1 = value!;
                                  if (value) {
                                    comfort.add('1');
                                  } else {
                                    comfort.remove('1');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("TV"),
                            Checkbox(
                              value: value2,
                              onChanged: (bool? value) {
                                setState(() {
                                  value2 = value!;
                                  if (value) {
                                    comfort.add('2');
                                  } else {
                                    comfort.remove('2');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Muzlatgich"),
                            Checkbox(
                              value: value3,
                              onChanged: (bool? value) {
                                setState(() {
                                  value3 = value!;
                                  if (value) {
                                    comfort.add('3');
                                  } else {
                                    comfort.remove('3');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Kir yuvish mashinasi"),
                            Checkbox(
                              value: value4,
                              onChanged: (bool? value) {
                                setState(() {
                                  value4 = value!;
                                  if (value) {
                                    comfort.add('4');
                                  } else {
                                    comfort.remove('4');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Konditsioner"),
                            Checkbox(
                              value: value5,
                              onChanged: (bool? value) {
                                setState(() {
                                  value5 = value!;
                                  if (value) {
                                    comfort.add('5');
                                  } else {
                                    comfort.remove('5');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Chang yutgich"),
                            Checkbox(
                              value: value6,
                              onChanged: (bool? value) {
                                setState(() {
                                  value6 = value!;
                                  if (value) {
                                    comfort.add('6');
                                  } else {
                                    comfort.remove('6');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
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
                          String comfortItems = comfort.join(',');
                          print('+++++++++++++++++++++');
                          print(data.districtId + 'district id');
                          print(addressController!.text + 'address');
                          print(map.isTapMap == false
                              ? '${widget.locations}'
                              : map.forMap.toString() + 'location');
                          print(
                              metro.toString() == 'ha' ? '1' : '2' + 'subway');
                          print(housetype == 'Kvartira'
                              ? '1'
                              : '2' + 'type of house');
                          print(housecount.toString() + 'count of rooms');
                          print(housefloorcount.toString() + 'count of floors');
                          print(howcountroom.toString() + 'in floor');
                          print(costcontroller!.text + 'cost');
                          print(pricerent_type + 'cost type');
                          print(price + 'rent type');
                          print(price1 + 'cost_period');
                          print(ownerlive + 'owner is with live');
                          print(costcommunal + 'utilite bils who pay');
                          print(comfortItems.toString() + 'comford');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostEditStudent(
                                updateid: widget.updateidi,
                                viloyatidisi: widget.viloyatidisi,
                                viloyatvalue: widget.viloyatvalue,
                                universiteteid: widget.universiteteid,
                                univervalue: widget.univervalue,
                                phoneController: widget.phoneController,
                                numbervalue: widget.numbervalue,
                                titlecontroller1: widget.titlecontroller1,
                                house: widget.house,
                                titleGendor: widget.titleGendor,
                                titlecount: widget.titlecount,
                                addinformation: widget.addinformation,
                                districtId: data.districtId,
                                comfort: comfortItems,
                                costlivekomunal:
                                    costcommunal.toString(),
                                metro:  metro.toString() == 'ha' ? '1' : '2',
                                countroom: housefloorcount.toString(),
                                housetype: housetype == 'Kvartira'? '1':'2',
                                howcountroom: howcountroom.toString(),
                                narxnituri: pricerent_type,
                                addressController: addressController!.text,
                                housecount: housecount.toString(),
                                ownerlive: ownerlive.toString(),
                                costController: costcontroller!.text,
                                rent_type: price,
                                cost_period: price1,
                                location: map.isTapMap == false
                                    ? '${widget.locations}'
                                    : map.forMap,
                                rasm: widget.images, floorscount: housefloorcount,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Keyingi".tr(),
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
