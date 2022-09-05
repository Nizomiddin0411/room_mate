import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
import 'package:talaba_uy/screens/menu/menu.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  bool _checkHome = false;
  bool _checkMetro = false;
  String? _dropownUsd;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        child: Column(
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
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: ExpansionTile(
                title: Text(
                  "Viloyatni tanlang",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                children: [],
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Tuman",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: ExpansionTile(
                title: Text(
                  "Tumanni tanlang",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                children: [],
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Manzil",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kvartal , Uy , Xonadon",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),
            
            SizedBox(height: 18.h),
            Text(
              "Xonadon ma’lumoti",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: _checkHome,
                    onChanged: (e) {
                      setState(() {
                        _checkHome = e!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text("Uy egasi bilan birga yashashga roziman !!!")
              ],
            ),
            SizedBox(height: 19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Uy turi",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          title: Text(
                            "Kvartira , Xovli",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Necha xona",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          title: Text(
                            "Xonalar soni",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "Ijara muddatini kiriting",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                width: 152.w,
                child: ExpansionTile(
                  title: Text(
                    "Ijara muddati",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  children: [],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Narxi",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Xonadonni narxini kiriting / oyiga",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.grey.shade300))),
                      padding: EdgeInsets.only(left: 8.w, top: 0),
                      width: 70,
                      height: 0,
                      child: DropdownButton(
                        underline: Container(),
                        value: _dropownUsd,
                        onChanged: (String? e) {
                          setState(() {
                            _dropownUsd = e;
                          });
                        },
                        hint: Text(
                          "SO'M",
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.textColor),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "SO'M",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
                            ),
                            value: "sum",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "USD",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.textColor),
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
              height: 16.h,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: _checkMetro,
                    onChanged: (e) {
                      setState(() {
                        _checkMetro = e!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text("Metroga yaqin")
              ],
            ),
            SizedBox(height: 22.h),
            Text(
              "Qo’shimcha",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sheriklarni tanlang",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          title: Text(
                            "Qiz , O’gil ",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Soni",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Container(
                        width: 152.w,
                        child: ExpansionTile(
                          title: Text(
                            "Ijarachilar soni",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "E’lonni nomlash",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "E’lonni nomlang",
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Qo’shimcha ma’lumot ",
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
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                child: TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Massage...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  cursorColor: Colors.grey.shade800,
                  cursorWidth: 1.5.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 31.w),
              child: Container(
                width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      primary: AppColors.buttonLinear
                    ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MenuPage()), (route) => false);
                },
                child: Text(
                  "E’lon saqlash",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
