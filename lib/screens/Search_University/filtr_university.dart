import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';

class UniverFiltrPage extends StatefulWidget {
  const UniverFiltrPage({Key? key}) : super(key: key);

  @override
  State<UniverFiltrPage> createState() => _UniverFiltrPageState();
}

class _UniverFiltrPageState extends State<UniverFiltrPage> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Consumer<SearchUniversitet>(
            builder: (_, provider, __) {
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
                  Text(
                    "Viloyat",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
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
                          'Viloyatni tanlang',
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
                              provider.RegionId = e.id.toString();
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
                        children: const [
                          Text("Tuman",style: TextStyle(fontWeight: FontWeight.w500),),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    'Tumanni tanlang',
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
                                            provider.DistrickId =
                                                e.id.toString();
                                            print(provider.DistrickId +
                                                "mmmmmmmmmfmgkfngfngjf");
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  isExpanded: true,
                                  isDense: true,
                                  hint: Text(
                                    'Tuman',
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: [],
                                  onChanged: null,
                                ),
                              ],
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(height: 300.h),
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
                              provider.getSearchUniver(
                                  '0', '0', '0');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => super.widget));
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
                              print(provider.DistrickId + provider.RegionId);
                              provider.getSearchUniver(
                                  '0', provider.RegionId, provider.DistrickId);
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
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
