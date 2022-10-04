import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/screens/Search_University/result_search_universitety.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import '../../provider/search_universitet_provider.dart';
import '../../provider/universitet_provider.dart';
import '../../services/searching_students_service.dart';

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
                      decoration: InputDecoration(
                        enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide()),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Qaysi viloyatliksiz',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: provider.Viloyat.map(
                            (e) => DropdownMenuItem<String>(
                          onTap: () {
                            setState(() {
                              Region = e.id.toString();
                            });
                          },
                          value: e.name ?? "",
                          child: Text(
                            e.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
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
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(" Qaysi tumanidansiz"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    provider.istuman
                        ? Column(
                      children: [
                        DropdownButtonFormField2<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide()),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            ' Qaysi tumanidansiz',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                          const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: provider.tumanlar
                              .map(
                                (e) => DropdownMenuItem<String>(
                              onTap: () {
                                setState(() {
                                  District = e.id.toString();
                                });
                              },
                              value: provider.istuman
                                  ? e.name.toString()
                                  : provider.defaultvalue1,
                              child: Text(
                                e.name.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
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
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide()),
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          isExpanded: true,
                          isDense: true,
                          hint: const Text(
                            'Tumaningiz',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                          const EdgeInsets.only(left: 20, right: 10),
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
                Text(
                  "Talaba",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                            decoration: InputDecoration(
                              enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide()),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            isDense: true,
                            hint: const Text(
                              "Yo'nalishingiz",
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: snapshot.data!
                                .map(
                                  (value) => DropdownMenuItem<String?>(
                                value: value.name,
                                child: Text(
                                  value.name,
                                  style: const TextStyle(
                                    fontSize: 14,
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
                            onSaved: (value) {},
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("Kurs ").tr(),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          isDense: true,
                          buttonElevation: 2,
                          hint: const Text(
                            "Kursni tanlang",
                            style: TextStyle(fontSize: 14),
                          ).tr(),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding:
                          const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: kursingizItems
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) =>
                          value == value ? 'Kursni tanlang' : null,
                          onChanged: (String? value) {
                            setState(() {});
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
                             side: BorderSide(color: Colors.red)),
                            primary: Colors.white
                             ),
                         onPressed: () {
                         },
                         child: Text(
                           "Tozalash",
                           style: TextStyle(color: Colors.red,
                               fontSize: 20.sp, fontWeight: FontWeight.w500),
                         ),
                       ),
                     ),
                     SizedBox(height: 20.h,),
                     Container(
                       width: 220.w,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                             padding: EdgeInsets.symmetric(vertical: 14.h),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10.r)),
                             primary: AppColors.buttonLinear),
                         onPressed: () {
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
    );
  }
}
