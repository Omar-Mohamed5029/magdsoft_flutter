import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/presentation/screens/presentations/product_detail.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/models/allproducts_model.dart';
import '../../widget/category_list.dart';
import '../../widget/product_card.dart';
import '../../widget/text_form_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  List<AllProducts_Data> allProducts_DataList = [];

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = GlobalCubit.get(context);
    globalCubit.Get_getProducts(context: context);
    allProducts_DataList = globalCubit.allProducts_DataList;
    // print("here");
    // print(allProducts_DataList);
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
                Row(
                  children: [
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
                      margin: EdgeInsets.only(
                          left: 15.sp, top: 20.sp, right: 16.sp),
                      // color: Colors.white,
                      width: 200.sp,
                      child: Text_Form_Field(
                        label: "Search",
                        type: TextInputType.text,
                        controller: searchController,
                        icon: Icons.search,
                      ),
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
                      margin: EdgeInsets.only(top: 20.sp, right: 17.sp),
                      // color: Colors.white,
                      height: 43.sp,
                      width: 50.sp,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.sp),
                    // color: Colors.grey,
                    width: double.infinity,
                    height: 40.sp,
                    child: Category_list()),
                SizedBox(
                  height: 10.sp,
                ),
                Expanded(
                    child: state is getProducts_loading_state
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            // color: Colors.grey,
                            // height: 80.sp,
                            margin: EdgeInsets.all(10.sp),
                            child: MasonryGridView.builder(
                                itemCount: allProducts_DataList.length,
                                gridDelegate:
                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: Product_Card(
                                      index: index,
                                      productItem: allProducts_DataList[index],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              // StatisticsScreen(homeCubit: homeCubit),
                                              // Get_ALLProducts()
                                              Prodcut_Deatail(productItem:allProducts_DataList[index] ,)
                                          ));
                                    },
                                  );
                                })))
              ],
            ),
          ),
        ),
      ));
    });
  }
}
