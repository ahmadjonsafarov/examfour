import 'package:examfour/view/pages/LoginAndRegister/sign_in.dart';
import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../../contoller/user_controller.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Style.black,
      body: context.watch<UserController>().isLoading
          ?Center(
        child: LoadingAnimationWidget.flickr(leftDotColor: Colors.blue, rightDotColor: Colors.yellow, size: 50),
      )
          :Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                context.watch<UserController>().user?.avatar==null
                    ?Row(
                      children: [
                        const Spacer(),
                        Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                  ),
                  child: Center(
                        child: Text(context.read<UserController>().user?.name?[0] ?? "",style: Style.whiteNormalText,),
                  ),
                ),
                        const Spacer(),
                      ],
                    )
                    :Row(
                      children:  [
                        const Spacer(),
                        ClipOval(
                          child: Image.network(context.read<UserController>().user?.avatar ?? "",height: 100,width: 100,),
                        ),
                        const Spacer(),
                      ],
                    ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    const Icon(Icons.person,color: Colors.white,size: 50,),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",style: Style.whiteInkwel,),
                        Text(context.read<UserController>().user?.name ?? "",style: const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(Icons.person_outline,color: Colors.white,size: 50,),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LastName",style: Style.whiteInkwel,),
                        Text(context.watch<UserController>().user?.username ?? "",style: const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(Icons.phone_android_outlined,color: Colors.white,size: 50,),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobil",style: Style.whiteInkwel,),
                        Text(context.read<UserController>().user?.phone ?? "",style: const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(Icons.text_snippet,color: Colors.white,size: 50,),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bio",style: Style.whiteInkwel,),
                        Text(context.read<UserController>().user?.bio ?? "",style: const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(Icons.date_range,color: Colors.white,size: 50,),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Brith",style: Style.whiteInkwel,),
                        Text(context.read<UserController>().user?.brith ?? "",style: const TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 100,),
                TextButton(onPressed: (){
                  context.read<UserController>().logOut(() {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const SignIN()), (route) => false);
                  });
                }, child: const Text("Chiqish")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
