import 'package:examfour/view/pages/onBoarding/second_onboarding.dart';
import 'package:examfour/view/utility/companent/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: OnBoarding(leftpadding1: 24.w, rightpadding1: 73.w, heighttoppadding1: 450.h, top32: 32.h, w13: 13.w, h10: 10.h, w80: 80.w, text1: "Let's explore Kinds of coffee", text2: "Let's explore various coffee flavors with us with just few clicks", index: 0, inkWelText: 'Next', w46: 46.w, widget: const Second(),),
        );
      },
    );
  }
}
