import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Category_list extends StatelessWidget {
  const Category_list({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5.sp),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              // color: Colors.white,

              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              )),
          width: 90.sp,
          // color:Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.sp, right: 10.sp),
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
                      Radius.circular(30),
                    )),
                child: CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: Colors.white,
                  child: Image(
                    // height: 20.sp,
                    image: AssetImage(
                      "assets/images/all_logo.png",
                    ),
                    // height: 20.sp,
                  ),
                ),
              ),
              Text(
                "All",
                style: TextStyle(fontSize: 15.sp , color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10.sp),
          margin: EdgeInsets.only(left: 5.sp),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              // color: Colors.white,

              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              )),
          // width: 90.sp,
          // color:Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(

                margin: EdgeInsets.only(left: 5.sp, right: 10.sp),
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
                      Radius.circular(30),
                    )),
                child: CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: Colors.white,
                  child: Image(
                    // height: 20.sp,
                    image: AssetImage(
                      "assets/images/acer_logo.png",
                    ),
                    // height: 20.sp,
                  ),
                ),
              ),
              Text(
                "Acer",
                style: TextStyle(fontSize: 15.sp),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10.sp),
          margin: EdgeInsets.only(left: 5.sp),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              // color: Colors.white,

              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              )),
          // width: 90.sp,
          // color:Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.sp, right: 10.sp),
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
                      Radius.circular(30),
                    )),
                child: CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: Colors.white,
                  child: Image(
                    // height: 20.sp,
                    image: AssetImage(
                      "assets/images/Razer-Logo.png",
                    ),
                    // height: 20.sp,
                  ),
                ),
              ),
              Text(
                "Razer",
                style: TextStyle(fontSize: 15.sp),
              )
            ],
          ),
        ),
      ],
    );
  }
}
