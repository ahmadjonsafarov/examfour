import 'package:examfour/view/pages/onBoarding/first_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../contoller/localstore/localStore.dart';
import '../Home/Home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)  async {
      String? docId = await LocalStore.getDocId();
      Future.delayed(Duration(seconds: 5),(){
        if (docId == null) {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const FirstPage()),
                  (route) => false);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
        }
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(color: Colors.white, size: 40),
      ),
    );
  }
}
