import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

class OffertoPage extends StatefulWidget {
  const OffertoPage({Key? key}) : super(key: key);

  @override
  State<OffertoPage> createState() => _OffertoPageState();
}

class _OffertoPageState extends State<OffertoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawScrollbar(
          thumbColor: Colors.blue,
          radius: Radius.circular(20),
          thickness:
          7,
          // Child can also be SingleChildScrollView, GridView, etc.
          child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Foydalanuvchi shartlari",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                )),
                SizedBox(
                  height: 15.h,
                ),
                Text("So’ngi yangilanish 02.03.2022"),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Eslatma!\nO‘zbekiston Respublikasining “Shaxsga doir ma'lumotlar to‘g‘risida”gi 02.07.2019 yildagi O‘RQ-547-sonli qonuniga \nasosan shaxsingizga doir ma'lumotlarga ishlov berishga rozilik berishingiz so‘raladi. Siz tomondan shaxsga doir ma'lumotlaringizga ishlov berishga rozilik berilgan taqdirda\n erkin foydalanilishi mumkin bo‘lgan yoki maxfiylikka rioya etishga doir talablar tatbiq etilmaydigan shaxsga\n doir ma'lumotlar (Shaxsga doir ma'lumotlarning hamma foydalanishi mumkin bo‘lgan manbalariga sub'ektning yozma roziligi bilan uning \nfamiliyasi, ismi, otasining ismi, tug‘ilgan yili va joyi, manzili, abonent raqami, kasbi\n to‘g‘risidagi ma'lumotlar hamda sub'ekt tomonidan ma'lum qilinadigan boshqa shaxsga doir ma'lumotlar kiritilishi mumkin.) hamma foydalanishi mumkin bo‘lgan\n shaxsga doir ma'lumotlaringiz dasturimizda oshkor etilishi mumkin. Siz tomondan kiritilgan maxfiy shaxsga doir ma'lumotlar\n uchinchi shaxslarga oshkor etilmaydi va tarqatilmaydi!",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Text(
                      //   "Eslatma!\nO‘zbekiston Respublikasining “Shaxsga doir ma'lumotlar to‘g‘risida”gi 02.07.2019 yildagi O‘RQ-547-sonli qonuniga \nasosan shaxsingizga doir ma'lumotlarga ishlov berishga rozilik berishingiz so‘raladi. Siz tomondan shaxsga doir ma'lumotlaringizga ishlov berishga rozilik berilgan taqdirda\n erkin foydalanilishi mumkin bo‘lgan yoki maxfiylikka rioya etishga doir talablar tatbiq etilmaydigan shaxsga\n doir ma'lumotlar (Shaxsga doir ma'lumotlarning hamma foydalanishi mumkin bo‘lgan manbalariga sub'ektning yozma roziligi bilan uning \nfamiliyasi, ismi, otasining ismi, tug‘ilgan yili va joyi, manzili, abonent raqami, kasbi\n to‘g‘risidagi ma'lumotlar hamda sub'ekt tomonidan ma'lum qilinadigan boshqa shaxsga doir ma'lumotlar kiritilishi mumkin.) hamma foydalanishi mumkin bo‘lgan\n shaxsga doir ma'lumotlaringiz dasturimizda oshkor etilishi mumkin. Siz tomondan kiritilgan maxfiy shaxsga doir ma'lumotlar\n uchinchi shaxslarga oshkor etilmaydi va tarqatilmaydi!",
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        width: 250.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: Colors.red)
                            ),
                          ),
                          child: Text(
                            "Rad etish",
                            style: TextStyle(color: Colors.red,fontSize: 20.sp),
                          ),


                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: 250.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Colors.blue)
                            ),
                          ),
                          child: Text(
                            "Qabul qilish",
                            style: TextStyle(color: Colors.blue,fontSize: 20.sp),
                          ),


                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
