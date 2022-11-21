import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import '../../provider/search_universitet_provider.dart';
import '../../provider/universitet_provider.dart';

class ResultFiltrPage extends StatefulWidget {
  final String id;

  const ResultFiltrPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ResultFiltrPage> createState() => _ResultFiltrPageState();
}

class _ResultFiltrPageState extends State<ResultFiltrPage> {
  void initState() {
    super.initState();
    Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
    Provider.of<SearchUniversitet>(context, listen: false).getViloyat();

    Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> kursingizItems = [
      '1 ',
      '2',
      '3 ',
      '4 ',
    ];
    String? Region;
    String? District;
    String? Fakultet;
    String Course = '';
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Text(
          "Filtr",
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Consumer<UniversitetProvider>(
          builder: (_, provider, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Text(
                  "Viloyat",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Column(
                  children: [
                    DropdownButtonFormField2<String>(
                      dropdownMaxHeight: 100.h,
                      decoration: InputDecoration(
                        enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide()),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      isExpanded: true,
                      hint: Text(
                        'Qaysi viloyatliksiz',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30.sp,
                      buttonHeight: 60.h,
                      buttonPadding: EdgeInsets.only(left: 20.w, right: 10.w),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: provider.Viloyat.map(
                        (e) => DropdownMenuItem<String>(
                          onTap: () {
                            provider.isRegion = true;
                            // setState(() {
                              // if(provider.RegionId == e.name){
                                provider.RegionOf = e.id.toString();
                              // }
                            // });
                          },
                          value: e.name ?? "",
                          child: Text(
                            e.name.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ).toList(),
                      onChanged: (newValue) async {
                        print("Selected ----------- $newValue");
                        final selected = provider.Viloyat.where(
                            (element) => element.name == newValue);
                        provider.getTuman(selected.last.id!);
                        provider.RegionId = newValue.toString();
                        print(provider.RegionId);
                        setState(() {});
                      },
                      onSaved: (value) {},
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
                          "Tuman",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    provider.istuman
                        ? Column(
                            children: [
                              DropdownButtonFormField2<String>(
                                dropdownMaxHeight: 100.h,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide()),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                isExpanded: true,
                                hint: Text(
                                  ' Qaysi tumanidansiz',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 60.h,
                                buttonPadding:
                                    EdgeInsets.only(left: 20.w, right: 10.w),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                items: provider.tumanlar
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        onTap: () {
                                          // setState(() {
                                            // if(provider.DistrickId == e.name){
                                              provider.DistrictOf = e.id.toString();
                                            // }

                                            provider.isDistrict = true;
                                          // });
                                        },
                                        value: provider.istuman
                                            ? e.name.toString()
                                            : provider.defaultvalue1,
                                        child: Text(
                                          e.name.toString(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  provider.DistrickId = value.toString();
                                  print(provider.DistrickId);
                                  setState(() {});
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide()),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                isExpanded: true,
                                isDense: true,
                                hint: Text(
                                  'Tumaningiz',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 60.h,
                                buttonPadding:
                                    EdgeInsets.only(left: 20.w, right: 10.w),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                items: const [],
                                onChanged: null,
                              ),
                            ],
                          ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Talaba",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Yo’nalish",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                FutureBuilder<List<GetFacultyModel>?>(
                  future:
                      GetFacultyService().fetchFaculty(int.parse(widget.id)),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          DropdownButtonFormField2<String?>(
                            dropdownMaxHeight: 100.h,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide()),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),

                            isExpanded: true,
                            isDense: true,
                            hint: Text(
                              "Yo'nalishingiz",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,

                            buttonHeight: 60.h,
                            buttonPadding:
                                EdgeInsets.only(left: 20.w, right: 10.w),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                            ),
                            items: snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String?>(
                                    onTap: () {
                                      provider.isFacultet = true;
                                      provider.FakultetId = value.id.toString();
                                    },
                                    value: value.name,
                                    child: Text(
                                      value.name!,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                Fakultet = value.toString();
                              });
                            },
                            // onSaved: (value) {},
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Kurs ",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ).tr(),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      children: [
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide()),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          isDense: true,
                          buttonElevation: 2,
                          hint: Text(
                            "Kursni tanlang",
                            style: TextStyle(fontSize: 14.sp),
                          ).tr(),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60.h,
                          buttonPadding:
                              EdgeInsets.only(left: 20.w, right: 10.w),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          items: kursingizItems
                              .map((item) => DropdownMenuItem<String>(
                                    onTap: () {
                                      provider.isCourse = true;
                                    },
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          // validator: (value) =>
                          //     value == value ? 'Kursni tanlang' : null,
                          onChanged: (String? value) {
                            provider.CourseOf = value.toString();

                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 130.h),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 220.w,
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: const BorderSide(color: Colors.red)),
                              primary: Colors.white),
                          onPressed: () {
                            provider.getAds(
                                UniverId: widget.id,
                                course: '0',
                                Fakultetid: '0',
                                Regionid: '0',
                                Districtid: '0');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                          },
                          child: Text(
                            "Tozalash",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 220.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              primary: AppColors.buttonLinear),
                          onPressed: () {
                            print(widget.id.toString() + 'univer');
                            print(provider.FakultetId.toString() + 'faqultet');
                            print(provider.CourseOf.toString() + 'course');
                            print(provider.DistrictOf.toString() + 'tuman');
                            print(provider.RegionOf.toString() + 'viloyat');
                            provider.getAds(
                                UniverId: widget.id,
                                Fakultetid: provider.isFacultet == true
                                    ? provider.FakultetId.toString()
                                    : '0',
                                course:
                                    provider.isCourse == true ? provider.CourseOf.toString() : '0',
                                Districtid: provider.isDistrict == true
                                    ? provider.DistrictOf.toString()
                                    : '0',
                                Regionid: provider.isRegion == true
                                    ? provider.RegionOf.toString()
                                    : '0');
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Saqlash",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
