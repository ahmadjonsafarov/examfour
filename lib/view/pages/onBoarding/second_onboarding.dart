import 'package:examfour/view/pages/onBoarding/third_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/companent/onboarding/onboarding.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: OnBoarding(leftpadding1: 24.w, rightpadding1: 40.w, heighttoppadding1: 450.h, top32: 32.h, w13: 13.w, h10: 10.h, w80: 80.w, text1: "Monitor andvisit the cafe", text2: "Monitor the state of the cafe and visit with your friends", index: 1, inkWelText: 'Next', w46: 46.w, widget: const Third(),),
        );
      },
    );
  }
}
