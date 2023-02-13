import 'package:examfour/view/utility/style/style.dart';
import 'package:flutter/material.dart';

class InkWel extends StatefulWidget {
  final String stringText;
  const InkWel({Key? key, required this.stringText,}) : super(key: key);

  @override
  State<InkWel> createState() => _InkWelState();
}

class _InkWelState extends State<InkWel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.green,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text(widget.stringText,style: Style.whiteInkwel,),
          ),
        ),
      );
  }
}
