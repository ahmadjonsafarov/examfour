import 'package:examfour/contoller/auth_controller.dart';
import 'package:examfour/view/pages/LoginAndRegister/signup/verfy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utility/companent/customtextfrom.dart';
import '../../../utility/companent/onboarding/inkweel.dart';
import '../../../utility/style/style.dart';

class Phone extends StatefulWidget {
  final String name;
  final String username;
  const Phone({Key? key, required this.name, required this.username}) : super(key: key);

  @override
  State<Phone> createState() => _PhineState();
}

class _PhineState extends State<Phone> {
  late TextEditingController phonecontroller;
  @override
  void initState() {
    phonecontroller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phonecontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Style.black.withOpacity(0.7),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                80.verticalSpace,
                GestureDetector(child: const Icon(Icons.arrow_back,size: 25,color: Colors.white,),onTap: (){Navigator.pop(context);},),
                52.verticalSpace,
                Text("Create New Account",style: TextStyle(color: Style.white,fontSize: 24,fontWeight: FontWeight.w600),),
                8.verticalSpace,
                const Text("Input Your Phone",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                36.verticalSpace,
                Text("Phone number",style: Style.whiteInkwel,),
                8.verticalSpace,
                CustomTextFrom(text: "Phone number", typetext: TextInputType.phone, textEditingController: phonecontroller,),
                24.verticalSpace,
                context.watch<AuthController>().errorText != null
                    ? Text(context.watch<AuthController>().errorText ?? "",style: const TextStyle(color: Colors.red),)
                    : const SizedBox.shrink(),
                const Spacer(),
                GestureDetector(child: const InkWel(stringText: "Create Account"),onTap: (){
                  context.read<AuthController>().sendSms(phonecontroller.text, () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> VerfyPage(name: widget.name, usernme: widget.username,)), (route) => false);
                  });
                },),
                40.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
