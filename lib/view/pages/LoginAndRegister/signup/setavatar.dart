import 'dart:io';
import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../contoller/auth_controller.dart';
import '../../Home/Home.dart';

class SetAvatar extends StatefulWidget {
  const SetAvatar({Key? key}) : super(key: key);

  @override
  State<SetAvatar> createState() => _SetAvatarState();
}

class _SetAvatarState extends State<SetAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                context.watch<AuthController>().imagePath.isEmpty
                    ? Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<AuthController>().getImageCamera();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child:  Text("Take phote",style: Style.whiteInkwel,)),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthController>().getImageGallery();
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child:  Text("Take file",style: Style.whiteInkwel,)),
                    ),
                  ],
                )
                    : const SizedBox.shrink(),

                context.watch<AuthController>().imagePath.isEmpty
                    ? const SizedBox.shrink()
                    : Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(
                              File(context.watch<AuthController>().imagePath),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                   child: Container(
                     width: double.infinity,
                       height: 70,
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: Text("Next",style: Style.whiteInkwel,)),
                 ),
              ],
            ),
          ),
        ));
  }
}