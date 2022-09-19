import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import '../../provider/universitet_provider.dart';
class ResultFiltrPage extends StatefulWidget {
  final String id;
  const ResultFiltrPage({Key? key,
  required this.id}) : super(key: key);
  @override
  State<ResultFiltrPage> createState() => _ResultFiltrPageState();
}
class _ResultFiltrPageState extends State<ResultFiltrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
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
          builder: (_, provider,__){
            return  Column(
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
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide()),
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
                      buttonPadding:
                      const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: provider.Viloyat
                          .map(
                            (e) => DropdownMenuItem<String>(
                          value: e.name ??"",
                          child: Text(
                            e.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (newValue) async {
                        print("Selected ----------- $newValue");
                        final selected = provider.Viloyat
                            .where((element) => element.name == newValue);
                        provider.getTuman(selected.last.id!);
                        setState(() {
                        });
                      },
                      onSaved: (value) {
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15,),
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
                        ?
                    Column(
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
                          items:provider.tumanlar
                              .map(
                                (e) => DropdownMenuItem<String>(
                              value: provider.istuman
                                  ?e.name.toString()
                                  :provider.defaultvalue1,
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
                            setState(() {
                            });
                          },
                        ),
                      ],
                    ):
                    Column(
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
                  future: GetFacultyService().fetchFaculty(int. parse(widget.id)),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          DropdownButtonFormField2<String?>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            isDense: true,
                            hint: const Text(
                              'Fakultetingiz',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(
                                left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items:   snapshot.data!
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
                                .toList() ,
                            onChanged: ( value) {
                              setState(() {
                              });
                            },
                            onSaved: (value) {
                            },
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                SizedBox(height: 250.h),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        primary: AppColors.buttonLinear),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Saqlash",
                      style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
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
