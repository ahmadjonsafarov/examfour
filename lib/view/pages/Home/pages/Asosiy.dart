import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../../contoller/user_controller.dart';

class Asosiy extends StatefulWidget {
  const Asosiy({Key? key}) : super(key: key);

  @override
  State<Asosiy> createState() => _AsosiyState();
}

class _AsosiyState extends State<Asosiy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<UserController>().isLoading
          ?Center(
        child: LoadingAnimationWidget.flickr(leftDotColor: Colors.blue, rightDotColor: Colors.yellow, size: 50),
      )
          :Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(context.watch<UserController>().user?.name ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
