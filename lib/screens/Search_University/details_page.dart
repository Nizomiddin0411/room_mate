import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

class UniverDetails extends StatefulWidget {
  final String cost;
  final String addres;
  final String room_count;
  final String live_with_owner;
  final String cost_type;
  final String roommate_count;
  final String roommate_gender;
  final String university;
  final String title;
  final String description;
  final String district_id;
  final String faculty;
  final String subway;
  final String region;

  const UniverDetails({
    Key? key,
    required this.cost,
    required this.addres,
    required this.roommate_count,
    required this.description,
    required this.room_count,
    required this.live_with_owner,
    required this.cost_type,
    required this.roommate_gender,
    required this.university,
    required this.title,
    required this.district_id,
    required this.faculty,
    required this.subway, required this.region,
  }) : super(key: key);

  @override
  State<UniverDetails> createState() => _UniverDetailsState();
}

class _UniverDetailsState extends State<UniverDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: Center(child: Text('Batafsil',style: TextStyle(color: AppColors.mainColor),)),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(
              padding:  const EdgeInsets.fromLTRB(18, 12, 18, 18),
              child: Container(
                width: 324.w,
                height: 232.h,
                decoration: BoxDecoration(
                  color: AppColors.secondBackgroud,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.r),
                      topRight: Radius.circular(6.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('${widget.cost_type} y.e/oy',style: TextStyle(fontSize: 24.sp,color: AppColors.mainColor),),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Icon(Icons.favorite_border,color: AppColors.error,),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" ${widget.description}",style: TextStyle(fontSize: 18.sp),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: const [
                                Icon(Icons.apartment,color: AppColors.mainColor,),
                                Text('Kvartira'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children:  [
                                Icon(Icons.apartment,color: AppColors.mainColor,),
                                Text('${widget.live_with_owner} xona'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children:  [
                                Icon(Icons.directions_walk,color: AppColors.mainColor,),
                                Text('${widget.roommate_count} kishi'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,0,12,12),
                      child: Container(
                        width: 95.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.colorBack3
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(11.0),
                              child: Icon(Icons.mail,color: AppColors.succesColor,),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Aloqa'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              width: 324.w,
              decoration: const BoxDecoration(
                color: AppColors.backgroundWhite,
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('Joylashuv',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.location_on,color: AppColors.succesColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.region.toString(),style: TextStyle(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.location_on,color: AppColors.succesColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Yunusobod tumani",style: TextStyle(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.iconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.corporate_fare,color: AppColors.mainColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width -150.w,
                              child: Text("${widget.university}",style: TextStyle(fontSize: 14.sp),)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.iconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.school,color: AppColors.mainColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${widget.faculty}",style: TextStyle(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    Text("Ma’lumot",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.house,color: AppColors.succesColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Uy egasi bilan birga yashshga rozi emas",style: TextStyle(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.directions_subway,color: AppColors.succesColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Metroga yaqin bo'lsin",style: TextStyle(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.colorBack3,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(child: Icon(Icons.house,color: AppColors.succesColor,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width -150.w,
                              child: Text("Bizga Universitetimizga yaqin joy-dan kvartira kerak.Ko’proq vaqtga turmoqchimiz.",style: TextStyle(fontSize: 14.sp),)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
