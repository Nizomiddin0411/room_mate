import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/provider/search_universitet_provider.dart';
import 'package:talaba_uy/provider/universitet_provider.dart';
import 'package:talaba_uy/screens/Search_University/filtr_university.dart';
import 'package:talaba_uy/screens/Search_University/result_search_universitety.dart';
import '../../core/const/app_colors.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();



  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<SearchUniversitet>().getSearchUniver("");
      Provider.of<UniversitetProvider>(context, listen: false).getViloyat();
      Provider.of<UniversitetProvider>(context, listen: false).getAds("0","0","0");
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundWhite,
        title:  Center(
          child: Text(
            "Oliy o’quv yurtlari",
            style: TextStyle(color: AppColors.mainColor),
          ).tr(),
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
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // label: Text("Search"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UniverFiltrPage()));
                          },
                          icon: Icon(
                            Icons.tune,
                            color: AppColors.textColor,
                          ),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {
                            Provider.of<SearchUniversitet>(context,
                                    listen: false)
                                .searchuniversitet;
                          },
                        ),
                      ),
                      onChanged: (value) {
                        context.read<SearchUniversitet>().getSearchUniver(value);
                      },
                    ),
                  ),
                ),
                Consumer<SearchUniversitet>(
                  builder: (_, data, __) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.searchuniversitet.length,
                        itemBuilder: (context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          (ResultUniversitetPage(
                                            name: "${data.searchuniversitet[index].name}",
                                            id: '${data.searchuniversitet[index].id}',
                                          ))));
                                },
                                child: Container(
                                  width: 324.w,
                                  height: 163.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.secondBackgroud),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/talim.png',
                                                width: 55.w,
                                                height: 55.h,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                                  150.w,
                                              child: Text(
                                                  data.searchuniversitet[index].name.toString()
                                                  ,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColors.mainColor)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width:
                                            MediaQuery.of(context).size.width -
                                                130.w,
                                            child: InkWell(
                                                onTap: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultUniversitetPage()));
                                                },
                                                child: Text(data.searchuniversitet[index].address.toString(),
                                                  style: TextStyle(fontSize: 12.sp),
                                                ))),
                                        SizedBox(
                                            width:
                                            MediaQuery.of(context).size.width -
                                                130.w,
                                            child: Text(
                                              tr("Sherik izlayotganlar:")+"${data.searchuniversitet[index].searching}",
                                              style: TextStyle(fontSize: 14.sp),
                                            )),
                                        SizedBox(
                                            width:
                                            MediaQuery.of(context).size.width -
                                                130.w,
                                            child: Text(
                                                tr("E’lon beruvchi:")+"${data.searchuniversitet[index].advertising}",
                                                style: TextStyle(fontSize: 14.sp)))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ),

      ),
    );
  }
}
