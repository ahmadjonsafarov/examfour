import 'package:examfour/contoller/user_controller.dart';
import 'package:examfour/view/pages/Home/pages/Asosiy.dart';
import 'package:examfour/view/pages/Home/pages/Like.dart';
import 'package:examfour/view/pages/Home/pages/chat.dart';
import 'package:examfour/view/pages/Home/pages/profil.dart';
import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list=[
    const Asosiy(),
    const Like(),
    const Chat(),
    const Profil(),
  ];
  int selectedIndex=0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[selectedIndex],
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Style.black,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });

        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded),
          BarItem(
            filledIcon: Icons.chat,
            outlinedIcon: Icons.chat_bubble_outline,
          ),
          BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline),
        ],
      ),

    );
  }
}
