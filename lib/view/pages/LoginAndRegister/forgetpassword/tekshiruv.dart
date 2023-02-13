import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../../contoller/auth_controller.dart';
import '../../../utility/style/style.dart';
import 'newpassword.dart';

class Tekshiruv extends StatefulWidget {
  const Tekshiruv({Key? key,}) : super(key: key);

  @override
  State<Tekshiruv> createState() => _TekshiruvState();
}

class _TekshiruvState extends State<Tekshiruv> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return  Scaffold(
          backgroundColor: Style.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.verticalSpace,
                GestureDetector(child: const Icon(Icons.arrow_back,size: 25,color: Colors.white,),onTap: (){Navigator.pop(context);},),
                52.verticalSpace,
                Text("Create New Account",style: TextStyle(color: Style.white,fontSize: 24,fontWeight: FontWeight.w600),),
                8.verticalSpace,
                const Text("Input Your Name",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                20.verticalSpace,
                PinFieldAutoFill(
                  controller: controller,
                  cursor: Cursor(color: Colors.black, enabled: true, width: 2),
                  decoration: const BoxLooseDecoration(
                    gapSpace: 10,
                    bgColorBuilder: FixedColorBuilder(
                      Colors.white,
                    ),
                    strokeColorBuilder: FixedColorBuilder(
                      Colors.black,
                    ),
                  ),
                  onCodeSubmitted: (s) {},
                  onCodeChanged: (s) {},
                  currentCode: "",
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<AuthController>().checkCode(controller.text,(){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const NewPassword()), (route) => false);
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: Style.green,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: context.watch<AuthController>()!.isLoading // ignore: unnecessary_non_null_assertion
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoadingAnimationWidget.flickr(leftDotColor: Colors.blue, rightDotColor: Colors.yellow, size: 16),
                      )
                          :  Center(child: Text("Submit",style: Style.whiteInkwel,))
                  ),
                ),
                40.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
