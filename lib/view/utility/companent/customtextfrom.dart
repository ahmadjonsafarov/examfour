import 'package:flutter/material.dart';

class CustomTextFrom extends StatefulWidget {
  final String text;
  final TextInputType typetext;
  final TextEditingController textEditingController;
  const CustomTextFrom({Key? key, required this.text, required this.typetext, required this.textEditingController,}) : super(key: key);

  @override
  State<CustomTextFrom> createState() => _CustomTextFromState();
}

class _CustomTextFromState extends State<CustomTextFrom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      keyboardType: widget.typetext,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration:  InputDecoration(
        hintText: widget.text,
        hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black,width: 2)),
      ),
    );
  }
}
