import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/app_colors.dart';

class CountStudentPage extends StatefulWidget {
  const CountStudentPage({Key? key}) : super(key: key);

  @override
  State<CountStudentPage> createState() => _CountStudentPageState();
}

class _CountStudentPageState extends State<CountStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: const Center(
          child: Text(
            "Oliy o’quv yurtlari",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AppColors.iconBack,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(18.0),
              child: Container(
                width: 324.w,
                height: 87.h,
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.backgroundWhite
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/accountImage.png',
                        width: 48.w,
                        height: 48.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150.w,
                        child: Text("Muhammad al-Xorazmiy nomidagi Toshkent axborot texnologiyalari universiteti Samarqand filiali",
                          style: TextStyle(fontSize: 14.sp,color: AppColors.mainColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ),
              Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                      itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: [
                            Container(
                              color: AppColors.backgroundWhite,
                              child: ListTile(
                                trailing: Icon(Icons.arrow_forward_ios),
                                title: Text("Dasturiy injinering fakulteti",
                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                subtitle: Row(
                                  children: [
                                    Text("Sherik izlayotganlar : 122 ta"),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Text("E’lon beruvchi : 94 ta")
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              // thickness: 0.1,
                              color: AppColors.mainColor,
                            )
                          ],
                        );
                      }
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
