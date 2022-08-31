import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(700),
        child: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          leading: Icon(Icons.menu,color: AppColors.iconColor,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:CircleAvatar(
                radius: 25,
              ),
            )
          ],
          title: Center(child: Text("Madad",style: TextStyle(color: AppColors.buttonLinear,fontSize: 24),)),
          flexibleSpace:
            Container(color:AppColors.backgroundWhite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridView(
                  padding: EdgeInsets.fromLTRB(18, 100, 18, 0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 18.w,
                      mainAxisSpacing: 18.h,
                      crossAxisCount: 2,
                      mainAxisExtent: 180.h),
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                          child: Image(
                            image: AssetImage("assets/images/building-mid-2 (1).png"),
                          ),
                          ),
                          SizedBox(height: 15,),
                          Text("Universitet bo'yicha",style: TextStyle(color: AppColors.textColor),)
                        ],
                      ),
                      decoration: BoxDecoration(

                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("assets/images/building-mid-1.png"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("E’lonlar",style: TextStyle(color: AppColors.textColor),)
                        ],
                      ),
                      decoration: BoxDecoration(

                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("assets/images/shop-1.png"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("Kunlik kvartira",style: TextStyle(color: AppColors.textColor),)
                        ],
                      ),
                      decoration: BoxDecoration(

                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("assets/images/shop-2.png"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("Oylik kvartira",style: TextStyle(color: AppColors.textColor),)
                        ],
                      ),
                      decoration: BoxDecoration(

                          color: AppColors.secondBackgroud,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),




                  ],

                  physics: const NeverScrollableScrollPhysics(),
                ),
                SizedBox(height: 200,),
                Container(
                  height: 48,
                  width: 250,
                  child: ElevatedButton(
                    child: Text('E’lon berish'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.buttonLinear,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),),

          ),
        ),

    );
  }
}
