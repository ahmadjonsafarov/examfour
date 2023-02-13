import 'package:examfour/contoller/auth_controller.dart';
import 'package:examfour/view/pages/LoginAndRegister/signup/setavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utility/companent/customtextfrom.dart';
import '../../../utility/style/style.dart';

class Password extends StatefulWidget {
  final String name;
  final String username;
  const Password({Key? key, required this.name, required this.username}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  late TextEditingController bio;
  late TextEditingController password;
  late TextEditingController gender;
  late TextEditingController brith;
  late TextEditingController email;

  @override
  void initState() {
    bio = TextEditingController();
    password = TextEditingController();
    gender = TextEditingController();
    brith = TextEditingController();
    email=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    bio.dispose();
    password.dispose();
    gender.dispose();
    brith.dispose();
    email.dispose();
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
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    GestureDetector(child: const Icon(
                      Icons.arrow_back, size: 25, color: Colors.white,),
                      onTap: () {
                        Navigator.pop(context);
                      },),
                    40.verticalSpace,
                    Text("Create New Account", style: TextStyle(
                        color: Style.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),),
                    8.verticalSpace,
                    const Text("Input Your Name", style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                    24.verticalSpace,
                    Text("Bio", style: Style.whiteInkwel,),
                    8.verticalSpace,
                    CustomTextFrom(text: "Bio",
                      typetext: TextInputType.text,
                      textEditingController: bio,),
                    12.verticalSpace,
                    Text("Password", style: Style.whiteInkwel,),
                    8.verticalSpace,
                    CustomTextFrom(text: "Password",
                      typetext: TextInputType.text,
                      textEditingController: password,),
                    12.verticalSpace,
                    Text("Gender", style: Style.whiteInkwel,),
                    8.verticalSpace,
                    CustomTextFrom(text: "Gender",
                      typetext: TextInputType.text,
                      textEditingController: gender,),
                    12.verticalSpace,
                    Text("brith", style: Style.whiteInkwel,),
                    8.verticalSpace,
                    CustomTextFrom(text: "brith",
                      typetext: TextInputType.text,
                      textEditingController: brith,),
                    Text("brith", style: Style.whiteInkwel,),
                    8.verticalSpace,
                    CustomTextFrom(text: "brith",
                      typetext: TextInputType.text,
                      textEditingController: brith,),
                    50.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        context.read<AuthController>().setStateUser(
                            name: widget.name,
                            username: widget.username,
                            password: password.text,
                            email: email.text,
                            gender: gender.text,
                            avatar: "",
                            bio: bio.text,
                            brith: brith.text,
                            onSuccess: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const SetAvatar()), (route) => false);
                            });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("Submit", style: Style.whiteInkwel,),
                        ),
                      ),
                    ),
                    305.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
