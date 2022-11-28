import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/screens/Feedback_Page/succed_page.dart';

import '../../core/const/app_colors.dart';
import '../../provider/feedback_provider.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.read<FeedbackProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundWhite,
        title: const Text(
          "O'z taklifingizni qoldiring",
          style: TextStyle(color: AppColors.mainColor),
        ).tr(),
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
        padding: EdgeInsets.fromLTRB(32.w, 18.h, 32.w, 100.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18.h,
              ),
              Center(
                child: const Text("Dasturga baxo bering").tr(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      provider.rentof = '0';
                      print(provider.rentof);
                    },
                    child: Image.asset('assets/images/1.png'),
                  ),
                  InkWell(
                    onTap: () {
                      provider.rentof = '1';
                      print(provider.rentof);
                    },
                    child: Image.asset('assets/images/2.png'),
                  ),
                  InkWell(
                    onTap: () {
                      provider.rentof = '2';
                      print(provider.rentof);
                    },
                    child: Image.asset('assets/images/3.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 54.h,
              ),
              const Text("Talab takliflar bo’lsa yozing").tr(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Container(
                  padding: EdgeInsets.only(left: 16.w),
                  child: TextFormField(
                    onChanged: (e) {
                      // if (e.length > 0) {
                      //   _descriptionOnClick = true;
                      //   _descriptionColor = Colors.grey;
                      // } else {
                      //   _descriptionOnClick = false;
                      //   _descriptionColor = Colors.red;
                      // }
                      setState(() {});
                    },
                    controller: descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText:
                          'Shu yerga xabaringizni batafsil yozing ...'.tr(),
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    cursorColor: Colors.grey.shade800,
                    cursorWidth: 1.5.w,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  tr("Eng yaxshi taklif uchun tanlov") + "!",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Mazkur rivojlantirish bo'yicha eng yaxshi takliflarni saralash maqsadida har yili tanlov o'tkaziladi.",
                style: TextStyle(fontSize: 16.sp),
              ).tr(),
              SizedBox(
                height: 8.h,
              ),
              const Text(
                  "Eng yaxshi deb topilgan 3 ta taklif egalari har yili avgust oyida qimmatbaho sovg'alar (iPhone 14 telefoni,noutbuq va planshet) bilan taqdirlanadi .").tr(),
              // const Text('2.Har oyning qaysidir sanasida 1 kishi tanlab olinadi .'),
              InkWell(
                onTap: () async {
                  print(provider.rentof);
                  provider.postFeedback(
                      provider.rentof == '0'
                          ? '0'
                          : provider.rentof == '1'
                              ? '1'
                              : '2',
                      descriptionController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccedPage()));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(23.w, 45.h, 23.w, 10.h),
                  child: Container(
                    width: 250.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.buttonLinear),
                    child: Center(
                        child: Text(
                      "Jo’natish",
                      style: TextStyle(
                          fontSize: 20.sp, color: AppColors.backgroundWhite),
                    ).tr()),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
