import 'package:examfour/view/pages/LoginAndRegister/splash_page.dart';
import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const SplashPage()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text("Coffee ",style: Style.whiteNormalText,),
                Text(" Been",style: Style.greenNormalText,),
                const Spacer(),
              ],
            ),
            const Spacer(),
            LoadingAnimationWidget.flickr(leftDotColor: Colors.blueAccent, rightDotColor: Colors.yellow, size: 35),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
