import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Text_Form_Field extends StatefulWidget {
  Text_Form_Field(
      {super.key,
      required this.controller,
      this.icon,
       this.label,
      required this.type,
      this.validation});

  final TextEditingController controller;
  final IconData? icon;
  final String? label;
  final TextInputType type;
  Function? validation;

  @override
  State<Text_Form_Field> createState() => _Text_Form_FieldState();
}

class _Text_Form_FieldState extends State<Text_Form_Field> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validation!(value),

      cursorColor: Colors.black,

      // textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   // borderSide: const BorderSide(width: 0.5),
        // ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          // borderSide: const BorderSide(width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          // borderSide: const BorderSide(width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          // borderSide: const BorderSide(width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          // borderSide: const BorderSide(width: 0.5),
        ),
        prefixIcon: Icon(
          widget.icon as IconData?,
          size: 20.0,
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(
            color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),

      keyboardType: widget.type,
      textInputAction: TextInputAction.done,
      controller: widget.controller,
    );
  }
}
