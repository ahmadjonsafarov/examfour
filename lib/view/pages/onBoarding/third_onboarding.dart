import 'package:examfour/view/pages/LoginAndRegister/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/companent/onboarding/onboarding.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: OnBoarding(leftpadding1: 24.w, rightpadding1: 40.w, heighttoppadding1: 450.h, top32: 22.h, w13: 13.w, h10: 10.h, w80: 80.w, text1: "Get ready for thenewest coffee", text2: "Get ready to try the newest coffee variant with your friends", index: 2, inkWelText: 'Get Started', w46: 60.w, widget: const SignIN(),),
        );
      },
    );
  }
}
