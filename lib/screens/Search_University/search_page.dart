import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // label: Text("Search"),
                  suffixIcon: Icon(
                    Icons.tune,
                    color: AppColors.textColor,
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
              itemCount: 15,
              itemBuilder: (context, int index) {
                return Container(
                  width: 324.w,
                  height: 163.h,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/;images/accountImage.png',
                            width: 48.w,
                            height: 48.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -150,
                            child: Text(
                              'Muhammad al-Xorazmiy nomidagi Toshkent axborot texnologiyalari universiteti'
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
