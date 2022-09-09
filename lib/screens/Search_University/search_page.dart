import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Search_University/filtr_university.dart';
import 'package:talaba_uy/screens/Search_University/result_search_universitety.dart';

import '../../core/const/app_colors.dart';
import 'count_student.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController? _titleController;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
             Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    // label: Text("Search"),
                    suffixIcon:
                       IconButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>UniverFiltrPage()));
                         },
                         icon: Icon(
                          Icons.tune,
                          color: AppColors.textColor,
                      ),
                       ),

                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, int index) {
                  return
            Column(
              children: [
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> (ResultUniversitetPage())));
                  },
                  child: Container(
                    width: 324.w,
                    height: 163.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.secondBackgroud
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/accountImage.png',
                                  width: 48.w,
                                  height: 48.h,
                                ),
                              ),
                              SizedBox(width: 6.w,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 150,
                                child:  Text(
                                    'Muhammad al-Xorazmiy nomidagi Toshkent axborot texnologiyalari universiteti',
                                style:TextStyle(fontSize: 14.sp,color: AppColors.mainColor)),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 130,
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultUniversitetPage()));
                                  },
                                  child: Text("Toshkent shahri Yunusobod tumani 108 Amir Temir shox ko’chasi 100200",style: TextStyle(fontSize: 10.sp),))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 130,
                              child: Text("Sherik izlayotganlar : 456 ta",style: TextStyle(fontSize: 14.sp),)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 130,
                              child: Text("E’lon beruvchi : 238 ta",style: TextStyle(fontSize: 14.sp)))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h,)
              ],
            );

                })
          ],
        ),
      ),
    );
  }
}
