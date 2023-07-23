import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OTP_Text_Form_Field extends StatelessWidget {
   OTP_Text_Form_Field({super.key,required this.controller,
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
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation!(value),

      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        // hintText: '*',
        border: InputBorder.none,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   // borderSide: const BorderSide(width: 0.5),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: const BorderSide(width: 0.5),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: const BorderSide(width: 0.5),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: const BorderSide(width: 0.5),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: const BorderSide(width: 0.5),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: const BorderSide(width: 0.5),
        // ),
        // prefixIcon: Icon(
        //   icon as IconData?,
        //   size: 20.0,
        // ),
        // labelText: label,
      //   labelStyle: const TextStyle(
      //       color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),

      keyboardType: type,
      textInputAction: TextInputAction.done,
      controller: controller,
    );
  }
}
