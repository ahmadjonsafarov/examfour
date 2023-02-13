import 'package:examfour/view/pages/LoginAndRegister/signup/phone.dart';
import 'package:examfour/view/utility/companent/customtextfrom.dart';
import 'package:examfour/view/utility/companent/onboarding/inkweel.dart';
import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoadingName=false;
  bool isLoadingUser=false;
  late TextEditingController firstname;
  late TextEditingController lastname;
  @override
  void initState() {
    firstname=TextEditingController();
    lastname=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
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
                const Text("Input Your Name",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                36.verticalSpace,
                Text("First Name",style: Style.whiteInkwel,),
                8.verticalSpace,
              TextFormField(
                onChanged: (e){
                  isLoadingName=false;
                  setState(() { });
                },
                controller: firstname,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration:  InputDecoration(
                  hintText: "First Name",
                  hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                ),
              ),
                5.verticalSpace,
                isLoadingName?const Text("ism kiritilmadi",style: TextStyle(color: Colors.red),):SizedBox.shrink(),
                24.verticalSpace,
                Text("Last Name",style: Style.whiteInkwel,),
                8.verticalSpace,
                TextFormField(
                  onChanged: (e){
                    isLoadingUser=false;
                    setState(() {});
                  },
                  controller: lastname,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration:  InputDecoration(
                    hintText: "Last Name",
                    hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                  ),
                ),
                5.verticalSpace,
                isLoadingUser?const Text("familiya kiritilmadi",style: TextStyle(color: Colors.red),):SizedBox.shrink(),
                const Spacer(),
                GestureDetector(child: const InkWel(stringText: "Input Accout"),onTap: (){
                  if(firstname.text.isNotEmpty && lastname.text.isNotEmpty){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Phone(name: firstname.text, username: lastname.text,)));
                  }else if(firstname.text.isEmpty && lastname.text.isEmpty){
                    isLoadingName=true;
                    isLoadingUser=true;
                    setState(() {   });
                  }else if(firstname.text.isNotEmpty && lastname.text.isEmpty){
                    isLoadingName=false;
                    isLoadingUser=true;
                    setState(() {   });
                  }else if(firstname.text.isEmpty && lastname.text.isNotEmpty){
                    isLoadingName=true;
                    isLoadingUser=false;
                    setState(() {  });
                  }
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
