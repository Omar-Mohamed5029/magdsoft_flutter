import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/allproducts_model.dart';

class Product_Card extends StatefulWidget {
  Product_Card({super.key, required this.index, required this.productItem});

  int index;
  AllProducts_Data productItem;

  @override
  State<Product_Card> createState() => _Product_CardState();
}

class _Product_CardState extends State<Product_Card> {
  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? Center(
            child: Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: Text(
                  "Recomended for you",
                  style: TextStyle(fontSize: 20.sp, color: Colors.black54),
                )))
        : Padding(
            padding: EdgeInsets.only(top: 20.sp, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  // color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Container(
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
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    }, alignment: Alignment.center),
                    decoration: BoxDecoration(
                        // color: Colors.brown,
                        // color: Colors.white,
                        borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                    height: 100.sp,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.sp, left: 5.sp),
                      child: Text(
                        "${widget.productItem.company}",
                        style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.sp, left: 5.sp),
                      child: Text(
                        "${widget.productItem.name}",
                        maxLines: 1,
                        style: TextStyle(fontSize: 10.sp, color: Colors.blue),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.sp, left: 5.sp),
                          child: Text(
                            "${widget.productItem.price}",
                            style:
                                TextStyle(fontSize: 10.sp, color: Colors.blue),
                          ),
                        ),
                      ),
                      Container(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.only(top: 8.8.sp),
                          width: 35.sp,
                          height: 35.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blue,
                                  Colors.white,
                                ],
                              ))),
                    ],
                  )
                ],
              ),
              width: 45.sp,
              height: 180.sp,
            ),
          );
  }
}
