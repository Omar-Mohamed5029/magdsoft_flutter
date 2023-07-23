import 'package:flutter/material.dart';
import 'package:magdsoft_task/presentation/widget/text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../widget/otp_text_form_field.dart';
import '../../widget/showtoasat.dart';
import '../presentations/gethelp.dart';

class OTP_Screen extends StatefulWidget {
  OTP_Screen({super.key, required this.globalCubit});

  GlobalCubit globalCubit;

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.white,
          ],
        )),
        child: SafeArea(
          child: Container(

            margin: EdgeInsets.only(top: 50.sp),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Verify Phone",
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.sp),
                  // padding: EdgeInsets.all(25.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          width: 50.sp,
                          // color: Colors.white,
                          child: OTP_Text_Form_Field(
                              controller: num1, type: TextInputType.number)),
                      Container(
                          width: 50.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: OTP_Text_Form_Field(
                              controller: num2, type: TextInputType.number)),
                      Container(
                          width: 50.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: OTP_Text_Form_Field(
                              controller: num3, type: TextInputType.number)),
                      Container(
                          width: 50.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: OTP_Text_Form_Field(
                              controller: num4, type: TextInputType.number)),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 210.sp,
                    height: 35.sp,
                    margin: EdgeInsets.only(top: 30.sp),
                    child: Center(
                      child: Text("Resend Code",
                          style: TextStyle(
                              fontSize: 20,
                              // color: Colors.blue
                              color: Color(int.parse("0037EfFF".substring(1, 7),
                                      radix: 16) +
                                  0xFF000000))),
                    ),
                  ),
                  onTap: (){
                    widget.globalCubit.Show_Code();
                  },
                ),
                // Center(child:Text("ReSend"),)
                SafeArea(
                  child: InkWell(
                    child: Container(
                      width: 210.sp,
                      height: 35.sp,
                      margin: EdgeInsets.only(top: 65.sp),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blueAccent,
                            Colors.lightBlueAccent
                          ]),
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Center(
                        child: Text("Verify Code",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    onTap: () async{
                      // flutterToast(msg: widget.globalCubit.phone, color: Colors.green);
                      String code =
                          '${num1.text}${num2.text}${num3.text}${num4.text}';
                      // flutterToast(msg: code, color: Colors.green);
                     await widget.globalCubit.Post_OTP(
                          phone: widget.globalCubit.phone, code: code);
                      if(widget.globalCubit.otp){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                // StatisticsScreen(homeCubit: homeCubit),
                                GetHelp(
                                  globalCubit: widget.globalCubit,
                                )));
                      }

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
