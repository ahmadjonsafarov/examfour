import 'package:examfour/view/pages/LoginAndRegister/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../contoller/auth_controller.dart';
import '../../utility/style/style.dart';
import '../Home/Home.dart';
import 'forgetpassword/phonepage.dart';

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  bool isIcon=false;
  bool isCheck=false;
  bool phoneLoading=false;
  bool passwordLoading=false;
  late TextEditingController phone;
  late TextEditingController password;
  @override
  void initState() {
    phone=TextEditingController();
    password=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    phone.dispose();
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
          backgroundColor: Style.black,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w,),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 62.h,bottom: 50.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text("Coffee ",style: Style.whiteNormalText,),
                      Text(" Been",style: Style.greenNormalText,),
                      const Spacer(),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Text("Phone",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),),
                    Spacer(),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child:TextFormField(
                      onChanged: (e){
                        phoneLoading=false;
                        setState(() { });
                      },
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration:  InputDecoration(
                        hintText: "Phone",
                        hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                      ),
                    )
                ),
                5.verticalSpace,
                phoneLoading? const Text("telefon nomer kiritilmadi",style: TextStyle(color: Colors.red),):SizedBox.shrink(),
                15.verticalSpace,
                Row(
                  children: const [
                    Text("Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),),
                    Spacer(),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child:TextFormField(
                    obscureText: isIcon?false:true,
                    onChanged: (e){
                      passwordLoading=false;
                      setState(() { });
                    },
                    controller: password,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration:  InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: (){
                            isIcon=!isIcon;
                            setState(() {});
                          },
                          child: Icon(isIcon?Icons.visibility:Icons.visibility_off,color: Colors.white,)),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
                    ),
                  )
                ),
                10.verticalSpace,
                passwordLoading ? const Text("passwordni kiritmadingiz",style: TextStyle(color: Colors.red),):const SizedBox.shrink(),
                context.watch<AuthController>().errorText != null
                    ? Text(context.watch<AuthController>().errorText ?? "",style: const TextStyle(color: Colors.red),)
                    : const SizedBox.shrink(),
                20.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        isCheck=!isCheck;
                        setState(() {  });
                      },
                      child: Container(
                        width: 25.r,
                        height: 25.r,
                        decoration: BoxDecoration(
                          color: Style.black,
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                          child:isCheck? const Icon(Icons.check,color: Colors.grey,size: 15,):SizedBox.shrink(),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Text("Remember me",style: Style.whiteInkwel,),
                    const Spacer(),
                    GestureDetector(child: Text("Forgot password",style: Style.whiteText400,),onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const PhonePage()));},),
                  ],
                ),
                74.verticalSpace,
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(child: Text("Create Account",style: Style.whiteInkwel,),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUp()));},),
                    const Spacer(),
                  ],
                ),
                25.verticalSpace,
                GestureDetector(
                  onTap: (){
                    if(password.text=="admin" && phone.text=="202303"){

                    }else if(phone.text.isNotEmpty  && password.text.isNotEmpty){
                      context
                          .read<AuthController>()
                          .login(phone.text,password.text,  () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                                (route) => false);
                      });
                    }else if(phone.text.isEmpty  && password.text.isEmpty){
                      phoneLoading=true;
                      passwordLoading=true;
                      setState(() {  });
                    }
                    else if(phone.text.isEmpty  && password.text.isNotEmpty){
                      phoneLoading=false;
                      passwordLoading=true;
                      setState(() {  });
                    }else if(phone.text.isNotEmpty  && password.text.isEmpty){
                      phoneLoading=true;
                      passwordLoading=false;
                      setState(() {  });
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Style.green,
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                    child:context.watch<AuthController>().isLoading
                        ?Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.blue, rightDotColor: Colors.yellow, size: 25),)
                        : Center(child: Text("Sign in",style: Style.whiteInkwel,)),
                  ),
                ),
                42.verticalSpace,
                Row(
                  children: [
                    Expanded(child: Divider(color:Style.white,thickness: 3,height: 32.w,)),
                    SizedBox(width: 10.w,),
                    Text("or continue with",style: Style.whiteInkwel,),
                    SizedBox(width: 10.w,),
                    Expanded(child: Divider(color:Style.white,thickness: 3,height: 32.w,)),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.read<AuthController>().loginGoogle(() {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 72.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: Style.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black,width: 2)
                        ),
                        child:context.watch<AuthController>().isGoogleLoading?Center(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.blue, rightDotColor: Colors.yellow, size: 25),): Image.asset('assets/Google.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        context.read<AuthController>().loginFacebook(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const HomePage()),
                                  (route) => false);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 72.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                            color: Style.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Image.asset('assets/facebook.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


