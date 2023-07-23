import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/allproducts_model.dart';

class Prodcut_Deatail extends StatefulWidget {
  Prodcut_Deatail({super.key, required this.productItem});

  AllProducts_Data productItem;

  @override
  State<Prodcut_Deatail> createState() => _Prodcut_DeatailState();
}

class _Prodcut_DeatailState extends State<Prodcut_Deatail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (Container(
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(20.sp),
                    width: 40.sp,
                    height: 40.sp,
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
                          Radius.circular(15),
                        )),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.sp, left: 20.sp),
                          child: Text(
                            "${widget.productItem.name}",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.sp, left: 20.sp),
                          child: Text(
                            "Type: ${widget.productItem.type}",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10.sp),
                          width: 220.sp,
                          height: 180.sp,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Image.network(

                              // loadingBuilder:(context, child, loadingProgress) {
                              //   return Center(child: CircularProgressIndicator());
                              // },
                              '${widget.productItem.image}', loadingBuilder:
                                  (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          }, alignment: Alignment.center),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20.sp,
                            left: 10.sp,
                            right: 10.sp,
                            bottom: 15.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.grey),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${widget.productItem.price}",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Container(
                                width: 150.sp,
                                height: 35.sp,
                                // margin: EdgeInsets.only(top: 20.sp),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.blueAccent,
                                      Colors.lightBlueAccent
                                    ]),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    )),
                                child: Center(
                                  child: Text("Add To Cart",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white)),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            width: 100.sp,
                            child: Divider(thickness: 2, color: Colors.grey)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Over View",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.black)),
                          Text("Spesification",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white)),
                          Text("Review",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Text(
                          "${widget.productItem.description}",
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
