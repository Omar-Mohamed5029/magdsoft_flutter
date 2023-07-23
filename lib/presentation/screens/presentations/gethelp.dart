import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../widget/gethelp_container.dart';
import '../layouts/navbar.dart';
import 'allproducts.dart';

class GetHelp extends StatefulWidget {
  GetHelp({super.key, required this.globalCubit});

  GlobalCubit globalCubit;

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  @override
  void initState() {
    // TODO: implement initState
    widget.globalCubit.Get_getHelp(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // widget.globalCubit.Get_getHelp(context: context);
    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35.sp),
                    child: Text(
                      "Help",
                      style: TextStyle(fontSize: 25.sp, color: Colors.white),
                    ),
                  ),
                  state is getHelp_loading_state
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                    width: double.infinity,
                        height: 400.sp,
                        child: Expanded(
                            child: ListView.builder(
                                itemCount:
                                    widget.globalCubit.getHelp_DataList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GetHelp_Container(
                                    getHelp_itemData: widget
                                        .globalCubit.getHelp_DataList[index],
                                    index: index,
                                  );
                                })),
                      ),
                  InkWell(
                    child: Container(
                      width: 210.sp,
                      height: 35.sp,
                      margin: EdgeInsets.only(top: 20.sp),
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
                        child: Text("Continue",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    onTap: () {
                      // flutterToast(msg: widget.globalCubit.phone, color: Colors.green);

                      // flutterToast(msg: code, color: Colors.green);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  // StatisticsScreen(homeCubit: homeCubit),
                                  // Get_ALLProducts()
                              BottomNavigation()
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    ;
  }
}

//
// class GetHelp extends StatelessWidget {
//   GetHelp({super.key, required this.globalCubit});
//
//   GlobalCubit globalCubit;
//
//   @override
//   Widget build(BuildContext context) {
//
//     globalCubit.Get_getHelp(context: context);
//
//
//   }
// }
