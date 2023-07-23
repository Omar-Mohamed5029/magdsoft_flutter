import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/presentation/widget/showtoasat.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/global_cubit/global_cubit.dart';
import '../../data/models/gethelp_model.dart';

class GetHelp_Container extends StatelessWidget {
  GetHelp_Container({super.key, required this.getHelp_itemData, required this.index});

  GetHelp_Data getHelp_itemData;
  int index;

  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = GlobalCubit.get(context);

    // flutterToast(msg: globalCubit.getHelp_state[index].toString(), color: Colors.grey);

    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {

    return Container(
      // height: 100,
      margin: const EdgeInsets.only(top: 20, right: 26, left: 26),
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
            Radius.circular(20),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Text(
              getHelp_itemData.question.toString(),
              style: TextStyle(fontSize: 15.sp, color: Colors.blue),
            ),
            trailing: IconButton(
                icon: Icon(
                  globalCubit.getHelp_state[index]
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () {
                  globalCubit.change_container_data(index);
                }),
          ),
          Visibility(
              visible: globalCubit.getHelp_state[index],
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  getHelp_itemData.answer.toString(),
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              )),
        ],
      ),
    );
    });
  }
}
