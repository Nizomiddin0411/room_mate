import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/favorite_provider.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Google_map/map_screen.dart';
import 'create_image.ads.dart';

class Student2 extends StatefulWidget {
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

  Student2(
      {Key? key,
      required this.titlecontroller1,
      required this.viloyatidisi,
      required this.viloyatvalue,
      required this.universiteteid,
      required this.univervalue,
      required this.titlecount,
      required this.titleGendor,
      required this.phoneController,
      required this.house,
      required this.addinformation,
      required this.numbervalue})
      : super(key: key);

  @override
  State<Student2> createState() => _Student2State();
}

class _Student2State extends State<Student2> {
  TextEditingController? titlecontroller;
  TextEditingController? othercontroller;
  TextEditingController? narxcontroller;
  String dropDown = "";
  String dropDown2 = "";
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
  String price = '';
  String costPeriode = '';
  String pricerent_type = '';
  String priceturi = '';
  String priceOfHouse = '1';
  String housetype = '';
  String? _dropownUsd;
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = false;
  Color _colorDistric = Colors.grey;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = false;
  Color _colorCountPupil = Colors.grey;
  bool _CountPupilOnClick = false;
  Color _colorForm = Colors.grey;
  bool _FormOnClick = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  List comfort = [];
  bool value6 = false;
  int metro = 0;
  int ownerlive = 0;
  int costcommunal = 0;
  var pricetype = ["Kuniga", "Oyiga", "Kishi boshiga"];
  String? cost_type;
  final TextEditingController _textEditingController = TextEditingController();
  var kurs = [
    '1-kurs',
    '2-kurs',
    '3-kurs',
    '4-kurs',
    '5-kurs',
    '6-kurs',
  ];
  var housecost = ["Oylik", "Kunlik", "Uzoq muddatga"];
  final List<String> genderItems = ["O'g'il bola ", "Qiz bola"];
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
    "5",
  ];
  Color _costTypeColor = Colors.grey;
  final addressController = TextEditingController();
  final costcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? housecount;
  String? howcountroom;
  String? housefloorcount;
  String? narxnituri;
  String? rent_type;
  String? cost_period;

  @override
  void initState() {
    super.initState();
    titlecontroller = TextEditingController();
    othercontroller = TextEditingController();
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
          "Elon yaratish",
          style: TextStyle(color: AppColors.mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<RegionProvider>(
            builder: (_, data, __) {
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
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: _colorRegion)),
                    child: DropdownButtonFormField(
                      menuMaxHeight: 100.h,
                      hint: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          "Viloyatni  / Shaharni tanlang",
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ),
                      decoration: const InputDecoration(border: InputBorder.none),
                      // value: ,
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
                            menuMaxHeight: 100.h,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text("Tumanni tanlang".tr(),style: TextStyle(fontSize: 14.sp),),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            items: data.districts.map((e) {
                              return DropdownMenuItem<String>(
                                onTap: () {

                                  data.districtId = e.id.toString();
                                  print(data.districtId + 'tuman');
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
                              hint: Text(
                                "Tumanni tanlang",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                              ),
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
                            width: 322.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: addressController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r)),
                                labelText: "Kvartal , Uy , Xonadon ",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapScreen()));
                      },
                      child: SizedBox(
                        width: 324.w,
                        height: 60.h,
                        child: Card(
                          shadowColor: AppColors.buttonLinear,
                          child: ListTile(
                            title: Text(
                              "Geojoylashishni kiriting",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
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
                                value: 1,
                                groupValue: metro,
                                onChanged: (val) {
                                  setState(() {
                                    metro = 1;
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style:  TextStyle(fontSize: 17.sp),
                              ),
                              SizedBox(
                                width: 55.w,
                              ),
                              Radio(
                                value: 2,
                                groupValue: metro,
                                onChanged: (val) {
                                  setState(() {
                                    metro = 2;
                                  });
                                },
                              ),
                              Text(
                                "Yo'q",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 10.h,
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
                                  "Kvartira , Xovli".tr(),
                                  style: TextStyle(
                                    color: AppColors.iconColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                print(housetype + "1 kunlik 2 kvartira");
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
                              // alignment: Alignment.bottomRight,
                              menuMaxHeight: 150,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "Xonalar soni".tr(),
                                  style: TextStyle(
                                    color: AppColors.iconColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                              itemHeight: 50,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text("Qavatlar soni ".tr(),
                                    style: TextStyle(
                                      color: AppColors.iconColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
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
                              elevation: 6,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "Nechinchi qavatda".tr(),
                                  style: TextStyle(
                                    color: AppColors.iconColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              items: in_floor.map((e) {
                                return DropdownMenuItem<String>(
                                  onTap: () {

                                  },
                                  value: e,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 18.w),
                                    child: Text(e.tr()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  howcountroom = newValue.toString();
                                  _colorGender = Colors.grey;
                                });
                                print(howcountroom.toString() + 'qavatttttt');
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
                      padding: EdgeInsets.only(left: 16.w),
                      child: TextFormField(
                        onChanged: (e) {
                          setState(() {
                            if (e.length > 0) {
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
                                  priceOfHouse = e == 'sum' ? '1' : '2';
                                  print(priceOfHouse + 'costof');
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
                            width: 160.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonFormField(
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text("Turlari".tr(),
                                    style: TextStyle(
                                      color: AppColors.iconColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
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
                                  print(newValue);
                                  if (newValue == 'Kuniga') {
                                    pricerent_type = '1';
                                    print(pricerent_type + 'narxning turlanishi');
                                  } else if (newValue == 'Oyiga') {
                                    pricerent_type = '2';
                                    print(pricerent_type + 'narxning turlanishi');
                                  }else{
                                    pricerent_type = '3';
                                    print(pricerent_type + 'narxning turlanishi');
                                  }

                                  // print(pricerent_type);
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
                                child: Text("Kunlik / Oylik ".tr(),
                                    style: TextStyle(
                                      color: AppColors.iconColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
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
                                    print(price +'rent type');
                                  } else if (newValue == 'Oylik') {
                                    price = '2';
                                    print(price +'rent type');
                                  }else{
                                    price = '3';
                                    print(price +'rent type');
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
                          Text("Uy egasi ham yashaydimi ?",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: ownerlive,
                                onChanged: (val) {
                                  setState(() {
                                    ownerlive = 1;
                                  });
                                },
                              ),
                              Text(
                                'Ha',
                                style:  TextStyle(fontSize: 17.0.sp),
                              ),
                              SizedBox(
                                width: 86.w,
                              ),
                              Radio(
                                value: 2,
                                groupValue: ownerlive,
                                onChanged: (val) {
                                  setState(() {
                                    ownerlive = 2;
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
                          Text("Kommunal to’lovlarini kim to’laydi ?",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: costcommunal,
                                onChanged: (val) {
                                  setState(() {
                                    costcommunal = 1;
                                  });
                                },
                              ),
                              Text(
                                "Uy egasi",
                                style:  TextStyle(fontSize: 17.sp),
                              ),
                              SizedBox(
                                width: 48.w,
                              ),
                              Radio(
                                value: 2,
                                groupValue: costcommunal,
                                onChanged: (val) {
                                  setState(() {
                                    costcommunal = 2;
                                  });
                                },
                              ),
                              Text(
                                "Ijarachi",
                                style: TextStyle(
                                  fontSize: 17.sp,
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
                      Text("Quyidagi qulayliklarga ega.",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 197.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Wi - fi ",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                            Checkbox(
                              value: this.value1,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value1 = value!;
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
                            Text("TV",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )),
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
                            Text("Muzlatgich",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )),
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
                            Text("Kir yuvish mashinasi",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.w500,
                                )),
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
                            Text("Konditsioner",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )),
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
                            Text("Chang yutgich",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )),
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
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            primary: AppColors.buttonLinear),
                        onPressed: () {
                          print('________________________');
                          print('________________________');
                          final map = context.read<FavoriteProvider>();
                          String comfortItems = comfort.join(',');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Createimage(
                                universiteteid: widget.universiteteid,
                                house: widget.house,
                                titleGendor: widget.titleGendor,
                                numbervalue: widget.numbervalue,
                                viloyatvalue: widget.viloyatvalue,
                                phoneController: widget.phoneController,
                                titlecontroller1: widget.titlecontroller1,
                                addinformation: widget.addinformation,
                                univervalue: widget.univervalue,
                                titlecount: widget.titlecount,
                                viloyatidisi: widget.viloyatidisi,
                                comfort: comfortItems,
                                costlivekomunal:
                                    costcommunal.toString(),
                                metro: metro.toString() == 'ha' ? '1' : '2',
                                countroom: housefloorcount.toString(),
                                housetype: housetype == 'Kvartira' ? '1' : '2',
                                howcountroom: howcountroom.toString(),
                                narxnituri: priceOfHouse,
                                addressController: addressController.text,
                                housecount: housecount.toString(),
                                ownerlive: ownerlive.toString(),
                                costController: costcontroller.text,
                                rent_type: price,
                                cost_period: pricerent_type,
                                location: '${map.forMap}', districId: data.districtId,
                              ),
                            ),
                          );
                          print('${widget.universiteteid} stay univer  yooo+++++++++++');
                          print('${widget.house}   have live home +++++++++++');
                          print('${widget.titleGendor}   jinsi +++++++++++');
                          print('${widget.numbervalue} phone matter  +++++++++++');
                          print('${widget.viloyatvalue} region matter   +++++++++++');
                          print('${widget.phoneController} phone nummber  +++++++++++');
                          print('${widget.titlecontroller1} title  +++++++++++');
                          print('${widget.addinformation} discription  +++++++++++');
                          print('${widget.univervalue} univer matter  +++++++++++');
                          print('${widget.titlecount} countRoom  +++++++++++');
                          print(data.districtId + 'district id viloyat');
                          print('${addressController.text} address  +++++++++++');
                          print('${map.forMap} == location ');
                          print('${metro.toString() == 'ha' ? '1' : '2'} subway');
                          print('${housetype== 'Kvartira' ? '1' : '2'} housetype  +++++++++++');
                          print('${housecount} count of rooms');
                          print('${housefloorcount} house count of floor  +++++++++++');
                          print('${howcountroom} in floor  +++++++++++');
                          print('${costcontroller.text}  cost house+++++++++++');
                          print('${priceOfHouse} kind of cost +++++++++++');
                          print('${pricerent_type} price type  +++++++++++');
                          print('${pricerent_type} cost periud narxning turlanishi +++++++++++');
                          print('${price} rent_type +++++++++++ kunlik');
                          print('${ownerlive} ownerlive  +++++++++++');
                          print('${costcommunal} costcommunal  +++++++++++');
                          print('${comfortItems} comfortItem  +++++++++++');
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
  }

  List<Marker> mymarker = [];
  _handlerTap(LatLng tappadPoint) {
    final mapLatitude = context.read<FavoriteProvider>();
    mapLatitude.forMap = (tappadPoint.toString());
    print(tappadPoint);
    print(mapLatitude.forMap);

    setState(() {
      mymarker = [];
      mymarker.add(Marker(
        markerId: MarkerId(tappadPoint.toString()),
        position: tappadPoint,
      ));
    });
  }

}
