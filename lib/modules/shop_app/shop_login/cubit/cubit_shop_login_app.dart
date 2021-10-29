import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/shop_app/login_shop_app.dart';
import 'package:project/modules/shop_app/shop_login/cubit/statess_shop_login_app.dart';
import 'package:project/shared/network/end_point.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates>

{
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(ShopLoginLoadingState());
    DioHelperShopApp.PostData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value)
    {
      print(value.data);
      loginModel=ShopLoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.email);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error){
      print('error is ');
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));

    });
  }


  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void ChangePasswordVisibility(){

    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off;
    emit(ShopChangePasswordVisibilityState());
  }

}