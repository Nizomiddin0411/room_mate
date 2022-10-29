import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/cubit/aut_cubit.dart';
import 'package:talaba_uy/provider/region_provider.dart';
import 'package:talaba_uy/screens/Favorit_Ads_Page/ads_continue_edit.dart';
import '../../models/get_district_model.dart';
import '../../provider/favorite_provider.dart';
import '../Google_map/map_for_ads_detail.dart';
import '../Google_map/map_for_edit.dart';
import '../Google_map/map_screen.dart';

class AdsEdit extends StatefulWidget {
  String? title;
  String? description;
  String? houseType;
  String? cost;
  String? costType;
  String? countRoom;
  String? countPeople;
  String? liveWithOwner;
  String? subway;
  String? favorite;
  String? id;
  String? type;
  int? userId;
  String? phoneNumber;
  String? comfort;
  String? inFloor;
  String? roommate_count;
  String? address;
  String? roommate_gender;
  String? locations;
  List? Image;
  String? universityId;
  String? region;
  String? rentType;
  String? floors_count;
  String? cost_period;
  String? gender_matter;
  String? university_id_matter;
  String? regionName;
  String? tumanName;
  String? live_with_owner;
  String? utility_electricity;
  String? unility_gaz;
  String? utility_hot_water;
  String? utility_cold_water;
  String? utility_trash;
  String? district_id;

  AdsEdit(
      this.title,
      this.description,
      this.houseType,
      this.cost,
      this.costType,
      this.countRoom,
      this.countPeople,
      this.liveWithOwner,
      this.subway,
      this.favorite,
      this.id,
      this.type,
      this.userId,
      this.phoneNumber,
      this.comfort,
      this.inFloor,
      this.roommate_count,
      this.address,
      this.roommate_gender,
      this.locations,
      this.Image,
      this.universityId,
      this.region,
      this.rentType,
      this.floors_count,
      this.cost_period,
      this.gender_matter,
      this.university_id_matter,
      this.regionName,
      this.tumanName,
      this.live_with_owner,
      this.utility_electricity,
      this.unility_gaz,
      this.utility_hot_water,
      this.utility_cold_water,
      this.utility_trash,
      this.district_id,
      {Key? key})
      : super(key: key);

  @override
  State<AdsEdit> createState() => _AdsEditState();
}

class _AdsEditState extends State<AdsEdit> {
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

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
  String dropDown2 = "";
  String countRoom = '';
  TextEditingController? titleController;
  TextEditingController? addressController;
  String? roommate_gender;
  String? gender_matter;
  String? district_id;
  String? university_id;
  String? university_id_matter;
  GetDistrictModel? dropDown1;
  Color _colorRegion = Colors.grey;
  bool _RegionOnClick = true;
  Color _colorDistric = Colors.grey;
  bool _DiscritOnClick = true;
  Color _colorUniver = Colors.grey;
  bool _UniverOnClick = true;
  Color _colorGender = Colors.grey;
  bool _GenderOnClick = true;
  Color _addressColor = Colors.grey;
  bool _addressOnClick = true;
  Color _otmColor = Colors.grey;
  bool _otmOnClick = true;
  bool? value5;
  bool? value6;
  String? id;
  bool? otmEnable;
  bool? genderEnable;

  bool value7 = false;
  String? univerName;
  int? index;
  // String region = '';

  var pricetype = [
    "1 ta odam kerak",
    "kishi boshiga 500",
  ];
  var kvartira = [
    'Kvartira',
    'Xovli',
  ];
  var gender = [
    "O'g'il bolaga",
    'Qiz bolaga',
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
    Provider.of<RegionProvider>(context, listen: false).getUnivers();

    addressController = TextEditingController(
        text: widget.address == null ? '' : widget.address);
    titleController =
        TextEditingController(text: widget.title == null ? '' : widget.title);
    roommate_gender = widget.roommate_gender == '1'
        ? "O'g'il bolaga"
        : widget.roommate_gender == '2'
            ? 'Qiz bolaga'
            : "O’gil bollarga / Qizlarga";
    // print(university_id_matter.toString() + "--++");

    // university_id_matter == '1' ? value5 = true : value5 = false;
    genderEnable = widget.gender_matter != '1' ? true : false;
    otmEnable = widget.university_id_matter != '1' ? true : false;
    value5 = widget.gender_matter == '1' ? true : false;
    value6 = widget.university_id_matter == '1' ? true : false;
    id = widget.subway;
    district_id = widget.district_id;
    super.initState();

    // district_id = widget.region;

    // print(district_id.toString() + "------");
  }

  int id2 = 2;
  int id3 = 3;
  int id4 = 4;
  int id5 = 5;
  int idhouse = 6;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;

  @override
  Widget build(BuildContext context) {
    print(widget.subway.toString() + "bbb");
    final mapLat = context.read<FavoriteProvider>();
    _markers.add(
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(41.311081, 69.240562),
          infoWindow: InfoWindow(
            title: 'My Position',
          )),
    );

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
                      border: Border.all(color: _colorUniver),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
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
                        hintText: "E’lonni nomlang".tr(),
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
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
                              border: Border.all(
                                  color: !genderEnable!
                                      ? Colors.grey.shade200
                                      : _colorGender)),
                          child: DropdownButtonFormField(
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                widget.roommate_gender == ''
                                    ? "O’g'il bollarga / Qizlarga".tr()
                                    : roommate_gender.toString().tr(),
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
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
                                value: e.tr(),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(e.tr()),
                                ),
                              );
                            }).toList(),
                            onChanged: genderEnable!
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
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Checkbox(
                          value: value5,
                          onChanged: (bool? value) {
                            setState(() {
                              value5 = value!;
                              gender_matter = value ? '1' : '2';

                              if (value) {
                                _colorGender = Colors.grey.shade200;
                                genderEnable = false;
                              } else {
                                _colorGender = Colors.red;
                                _GenderOnClick = false;
                                genderEnable = true;
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
                    hint: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text(
                        widget.regionName.toString().tr(),
                        style: TextStyle(
                            fontSize: 16.sp, color: AppColors.textColor),
                      ),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    // value: ,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    ),
                    items: data.regions.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.name ?? "",
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            e.name.toString(),
                            style: TextStyle(
                                fontSize: 16.sp, color: AppColors.textColor),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      final selected = data.regions
                          .where((element) => element.name == newValue);
                      data.getDistrict(selected.last.id!);
                      setState(() {
                        print(selected.last.id!);
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
                          isExpanded: true,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              widget.tumanName.toString().tr(),
                              style: TextStyle(
                                  color: AppColors.textColor, fontSize: 16.sp),
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                          items: data.districts.map((e) {
                            print(widget.region);
                            if (widget.region == e.id.toString()) {
                              // region = e.name.toString();
                            }
                            return DropdownMenuItem<String>(
                              onTap: () {
                                data.districtOwnerId = e.id.toString();

                                district_id = e.id.toString();
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
                              child: Text("Tumanni tanlang".tr()),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: [],
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
                    padding: EdgeInsets.only(left: 16.w),
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
                    child: Container(
                      width: 324.w,
                      height: 60.h,
                      child: Card(
                        shadowColor: AppColors.buttonLinear,
                        child: ListTile(
                          title: Text("Geojoylashishni kiriting").tr(),
                          leading: Icon(
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
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                                });
                              },
                            ),
                            Text(
                              'Ha'.tr(),
                              style: new TextStyle(fontSize: 14.0.sp),
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
                                });
                              },
                            ),
                            Text(
                              "Yo'q".tr(),
                              style: new TextStyle(
                                fontSize: 14.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  "OTM ga yaqinmi ?".tr(),
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
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
                      width: 240.w,
                      padding: EdgeInsets.only(left: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color:
                                !otmEnable! ? Colors.grey.shade200 : _otmColor),
                      ),
                      child: DropdownSearch<String>(
                        dropdownBuilder: _style,
                        enabled: otmEnable!,
                        dropdownSearchDecoration:
                            InputDecoration(border: InputBorder.none),

                        mode: Mode.BOTTOM_SHEET,
                        items: data.univer.map((e) {
                          // univerName = e.name!;
                          // print(e);
                          if (context.read<AutCubit>().selectedLang.index ==
                              1) {
                            if (widget.universityId == e.id.toString()) {
                              dropDown2 = e.name.toString();
                            }

                            if (dropDown2 == e.name) {
                              data.UniverId = e.id.toString();
                              data.isId = e.id;
                              widget.universityId = e.id.toString();
                            }
                          } else {
                            if (dropDown2 == e.nameRu) {
                              data.UniverId = e.id.toString();
                              data.isId = e.id;
                              widget.universityId = e.id.toString();
                            }
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
                          // data.isUniver = true;
                          // final selected = data.univer
                          //     .where((element) => element.name == value);
                          // data.getFaculty(selected.last.id!);
                          // data.getFaculty(data.isId!);
                          dropDown2 = value.toString();
                          print(dropDown2.toString() + "--------");
                          _otmOnClick = true;
                          _otmColor = Colors.grey;
                        },
                        selectedItem: tr(widget.universityId == null ||
                                widget.universityId == '0'
                            ? "OTM ni tanlang"
                            : dropDown2.toString()),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "Ahamiyatsiz".tr(),
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.textColor),
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
                              } else {
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
                  child: Container(
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
                          print('${value5! ? 0 : roommate_gender}' + 'gender');
                          print('${value5! ? 1 : 2} axamyatsiz gender');
                          print('${district_id} distruqt id');
                          print('${addressController!.text} Address');
                          print('${id} metrooo');
                          print(
                              '${value6! ? 0 : widget.universityId} univer id');
                          print('${value6! ? 1 : 2} axamyatsiz univer');
                          if (_RegionOnClick &&
                              _DiscritOnClick &&
                              _UniverOnClick &&
                              (_GenderOnClick || gender_matter == '1') &&
                              _addressOnClick &&
                              (_otmOnClick || university_id_matter == '1')) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdsContinueEdit(
                                          id: widget.id,
                                          addressController:
                                              addressController!.text,
                                          university_id:
                                              '${value6! ? 0 : widget.universityId}',
                                          roommate_gender:
                                              '${value5! ? 0 : roommate_gender}',
                                          university_id_matter:
                                              '${value6! ? 1 : 2}',
                                          gender_matter: '${value5! ? 1 : 2}',
                                          district_id: district_id,
                                          titleController:
                                              titleController!.text,
                                          location: '${map.forMap}',
                                          phoneNumber: widget.phoneNumber,
                                          houseType: widget.houseType,
                                          rent_type: widget.rentType,
                                          room_count: widget.countRoom,
                                          floors_count: widget.floors_count,
                                          in_floor: widget.inFloor,
                                          cost: widget.cost,
                                          cost_period: widget.cost_period,
                                          description: widget.description,
                                          live_with_owner:
                                              widget.live_with_owner,
                                          comfort: widget.comfort,
                                          utility_electricity:
                                              widget.utility_electricity,
                                          unility_gaz: widget.unility_gaz,
                                          utility_hot_water:
                                              widget.utility_hot_water,
                                          utility_cold_water:
                                              widget.utility_cold_water,
                                          utility_trash: widget.utility_trash,
                                          subway: id.toString(),
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

  Widget _style(BuildContext context, String? selectedItem) {
    return Text(
      selectedItem!,
      style: TextStyle(fontSize: 12.sp),
    );
  }
}
