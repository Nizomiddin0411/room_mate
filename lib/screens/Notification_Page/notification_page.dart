import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../provider/chat_permit_provider.dart';
import '../../services/get_permit_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    print("dsd");
    GetPermitSevice().fetchPermit();
    Provider.of<ChatPermit>(context, listen: false).Permit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundWhite,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: const Text(
            "Bildirishnoma",
            style: TextStyle(color: AppColors.mainColor),
          ).tr(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
        child: Column(
          children: [
            Consumer<ChatPermit>(
              builder: (_,data,__) {
              return ListView.builder(
              itemCount: data.permit.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 151.h,
                    width: 324.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.iconBack,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.permit[index].userAskedFullName.toString(),style: TextStyle(fontSize: 18.sp),),
                          SizedBox(height: 5.h,),
                          Text("Siz bilan suxbatlashish uchun so’rov jo’natdi !!!",style: TextStyle(fontSize: 12.sp),),
                         SizedBox(
                           height: 25.h,
                         ),
                          Row(
                            children: [
                              Container(
                                width: 133.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.buttonLinear
                                ),
                                child: Center(
                                  child: Text("Qabul qilish ",style: TextStyle(color: AppColors.backgroundWhite),),
                                ),
                              ),
                              SizedBox(width: 18.w,),
                              Container(
                                width: 133.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.error
                                ),
                                child: Center(
                                  child: Text("Rad etish ",style: TextStyle(color: AppColors.backgroundWhite),),
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              );
              },
            );
  },
),
          ],
        ),
      ),
    );
  }
}
