import 'package:examfour/view/utility/companent/onboarding/inkweel.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class OnBoarding extends StatelessWidget {
  final double leftpadding1;
  final double rightpadding1;
  final double heighttoppadding1;
  final double top32;
  final double w13;
  final double h10;
  final double w80;
  final String text1;
  final String text2;
  final String inkWelText;
  final int index;
  final double w46;
  final Widget widget;
  const OnBoarding({Key? key,required this.leftpadding1, required this.rightpadding1, required this.heighttoppadding1, required this.top32, required this.w13, required this.h10, required this.w80, required this.text1, required this.text2, required this.index, required this.inkWelText, required this.w46, required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/onboarding.png"),
            fit: BoxFit.cover,
          )
      ),
      child: Column(
        children:  [
          Padding(
            padding: EdgeInsets.only(left: leftpadding1,right: rightpadding1,top: heighttoppadding1),
            child: Text(text1,style: Style.whiteTextNormalSize,textAlign: TextAlign.start,),
          ),
          Padding(
            padding: EdgeInsets.only(left: leftpadding1,right: w80,top: h10),
            child: Text(text2,style: Style.whiteText400,textAlign: TextAlign.start,),
          ),
          Padding(
            padding: EdgeInsets.only(left: leftpadding1,right: leftpadding1,top: top32),
            child: Row(
              children: [
                Expanded(child: Divider(color:index==0? Style.green:Style.white,thickness: 3,height: top32,)),
                SizedBox(width: w13,),
                Expanded(child: Divider(color:index==1? Style.green:Style.white,thickness: 3,height: top32,)),
                SizedBox(width: w13,),
                Expanded(child: Divider(color:index==2? Style.green:Style.white,thickness: 3,height: top32,)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: w46),
            child: InkWell(
                onTap: (){
                  if(index==2){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>widget), (route) => false);
                  }else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>widget));
                  }
                  
                },
                child: InkWel(stringText: inkWelText)),
          ),
        ],
      ),
    );
  }
}
