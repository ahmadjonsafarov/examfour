import 'package:examfour/contoller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sign_in.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Sizning parolingiz: ${context.watch<AuthController>().userModel?.password ?? ""}"),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const SignIN()), (route) => false);
            },
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text("Asosiy Pagega qaytish"),
            ),
          ),
          )
        ],
      ),
    );
  }
}
