import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/remote/Dio_Helper.dart';
import 'package:shop_app/modeles/Shop_Modeles/Login_modeles.dart';
import 'package:shop_app/modules/LoginScreen/Cubit/states_login.dart';
import '../../../Network/End_points.dart';


class CountCubit extends Cubit<CountStates> {

  CountCubit() : super(InitialeStates());
  static CountCubit get(context) => BlocProvider.of(context);
 late Shopeloginmodels loginmodele;
  void userlogin({required String email, required String passwored}) {
    emit(LoadingStates());
    DioHelper.postData(
        url: login,
        data: {
      'email': email,
      'password': passwored,
    }).then((value) {
       print(value.data);
       loginmodele =  Shopeloginmodels.fromjason(value.data);
      emit(SuccesStates(loginmodele));
    }).catchError((error) {
      emit(ErrorStates(error.toString()));
    });
  }

  IconData icon = Icons.visibility_off;
  bool textScure = true;
  void TextSecure() {
    textScure = !textScure;
    icon = textScure ? Icons.visibility : Icons.visibility_off;
    emit(EyeStates());
  }
}
