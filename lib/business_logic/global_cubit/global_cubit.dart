import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/allproducts_model.dart';
import '../../data/models/gethelp_model.dart';
import '../../presentation/widget/showtoasat.dart';
import '../../presentation/widget/toast.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  String name = '';
  String phone = '';
  String code = '';

  bool otp = false;

  List<GetHelp_Data> getHelp_DataList = [];
  List<bool> getHelp_state = [false, false, false, false, false];
  List<AllProducts_Data> allProducts_DataList = [];

  change_container_data(index) {
    getHelp_state[index] = !getHelp_state[index];
    emit(getHelp_change_height());
  }

  Show_Code() {
    flutterToast(msg: code, color: Colors.white);
  }

  Future Post_Verify(
      {required String phone, required String name, context}) async {
    emit(Verify_Loading_state());
    DioHelper.postData(url: verifyPhone_endpoint, body: {
      "phone": phone.toString(),
      "name": name.toString(),
    }).then((value) async {
      if (value.data['message'] == 'Account Verified') {
        flutterToast(msg: value.data['code'], color: Colors.green);

        this.name = name;
        this.phone = phone;
        this.code = value.data['code'].toString();

        // print(value.toString());
        flutterToast(msg: value.data['code'], color: Colors.green);

        // showToast(value.data.toString());
        emit(Verify_Success_state());
        return true;
      } else
        flutterToast(msg: value.data['message'], color: Colors.green);
      return false;
    }).catchError((error) {
      if (kDebugMode) {
        // showToast(error.data.toString());
        print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(Verify_Error_state());
      return false;
    });
  }

  Future Post_OTP(
      {required String phone, required String code, context}) async {
    emit(OTP_loading_state());
    DioHelper.postData(url: otp_endpoint, body: {
      "phone": phone.toString(),
      "code": code.toString(),
    }).then((value) async {
      if (value.data['message'] == 'Account Verified') {
        print(value.toString());
        flutterToast(msg: value.data['message'], color: Colors.green);
        otp = true;
        // showToast(value.data.toString());
        emit(OTP_Success_state());
      } else {
        flutterToast(msg: value.data['message'], color: Colors.green);
        emit(OTP_Error_state());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(OTP_Error_state());
    });
  }

  Future Get_getHelp({context}) async {
    emit(getHelp_loading_state());

    DioHelper.getData(url: getHelp_endpoint).then((value) async {
      if (value.statusCode == 200) {
        print(value.data.toString());
        flutterToast(msg: value.data['message'], color: Colors.green);

        GetHelp_Model getHelp_Model = GetHelp_Model.fromJson(json: value.data);
        getHelp_DataList = getHelp_Model.getHelp_DataList;
        // getHelp_state.length = getHelp_DataList.length;
        // getHelp_state =
        //     List.filled(getHelp_state.length, false, growable: true);
        // getHelp_state = getHelp_state.map<bool>((v) => false).toList();

        // flutterToast(msg: getHelp_DataList[2].question.toString(), color: Colors.green);

        // showToast(value.data.toString());
        emit(getHelp_Success_state());
      }
    }).catchError((error) {
      if (kDebugMode) {
        showToast(error.data.toString());
        // print("herer");
        print(error.toString());
        showToast("omar");

        // print(error.toString());
      }
      emit(getHelp_Error_state());
    });
  }

  Future Get_getProducts({context}) async {
    emit(getProducts_loading_state());
    DioHelper.getData(url: getProducts_endpoint).then((value) async {
      if (value.data['message'] == 'Successful') {
        // print(value.data.toString());
        // flutterToast(msg: value.data['message'], color: Colors.green);

        AllProducts_Model allProducts_Model =
            AllProducts_Model.fromJson(json: value.data);
        allProducts_DataList = allProducts_Model.allProducts_Data;

        // showToast(value.data.toString());
        emit(getProducts_Success_state());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.green);
        print(error.toString());

        // print(error.toString());
      }
      emit(getProducts_Error_state());
    });
  }
}

// class GetHelp_State {
//   bool visible = false;
//
//   // double h = 100;
//   bool icon_state = false;
// }
