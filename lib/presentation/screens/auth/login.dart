import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/presentation/screens/auth/otp_screen.dart';
import 'package:magdsoft_task/presentation/widget/showtoasat.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../widget/text_form_field.dart';

class LogIN_Screen extends StatefulWidget {
  const LogIN_Screen({super.key});

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}

class _LogIN_ScreenState extends State<LogIN_Screen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = GlobalCubit.get(context);
    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
      return Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Image(
                  height: 386,
                  image: AssetImage('assets/images/login_background.png')),
              Container(
                margin: const EdgeInsets.only(top: 316),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
              ),
              SafeArea(
                child: Container(
                  // height: 400.sp,
                  // width: 450.sp,
                  margin: const EdgeInsets.only(top: 140, right: 26, left: 26),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Welcome',
                            style:
                            TextStyle(color: Colors.black87, fontSize: 30),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 114, right: 115, top: 5, bottom: 16),
                        child: Divider(thickness: 3, color: Colors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        height: 35.sp,
                        width: 200.sp,
                        child: Text_Form_Field(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'enter your full name',
                        ),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        height: 35.sp,
                        width: 200.sp,
                        child: Text_Form_Field(
                          controller: phoneController,
                          type: TextInputType.number,
                          label: 'number',
                        ),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      // state is Verify_Loading_state
                      //     ? Center(
                      //         child: CircularProgressIndicator(),
                      //       )
                      //     :
                      InkWell(
                        child: Container(
                          width: 210.sp,
                          height: 35.sp,
                          margin: EdgeInsets.only(bottom: 15.sp),
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
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        ),
                        onTap: ()  {
                           globalCubit.Post_Verify(
                              name: nameController.text,
                              phone: phoneController.text,
                              context: context);


                          state is Verify_Loading_state?Center(
                            child: CircularProgressIndicator(),
                          ):state is Verify_Success_state?
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  // StatisticsScreen(homeCubit: homeCubit),
                                  OTP_Screen(
                                    globalCubit: globalCubit,
                                  ))):null;
                          // flutterToast(msg: "here", color: Colors.white);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.sp,
                // color: Colors.grey,
                // padding: EdgeInsets.only(left: 30.sp),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 400.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 100.sp,
                        child: Divider(thickness: 3, color: Colors.grey)),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 25.sp, color: Colors.grey),
                    ),
                    SizedBox(
                        width: 100.sp,
                        child: Divider(thickness: 3, color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                // color: Colors.grey,
                // padding: EdgeInsets.only(left: 30.sp),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 500.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20.0.sp,
                        backgroundColor: Colors.white,
                        child: Text(
                          "f",
                          style: TextStyle(
                              fontSize: 20.sp, color: Colors.lightBlue),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20.0.sp,
                        backgroundColor: Colors.white,
                        child:
                        Image(image: AssetImage('assets/images/ios 1.png')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20.0.sp,
                        backgroundColor: Colors.white,
                        child: Image(
                            image: AssetImage(
                                'assets/images/Google__G__Logo 1.png')),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
