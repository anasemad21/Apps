import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/shop_app/login_shop_app.dart';
import 'package:project/modules/shop_app/register/cubit/statess_shop_register_app.dart';
import 'package:project/shared/network/end_point.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>

{
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel? LoginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,

  })
  {
    emit(ShopRegisterLoadingState());
    DioHelperShopApp.PostData(
      url: REGISTER,
      data: {
        'email':email,
        'password':password,
        'name':name,
        'phone':phone,
      },
    ).then((value)
    {
      print(value.data);
      LoginModel=ShopLoginModel.fromJson(value.data);
      // print(LoginModel!.status);
      // print(LoginModel!.message);
      // print(LoginModel!.data!.email);
      emit(ShopRegisterSuccessState(LoginModel!));
    }).catchError((error){
      print('error is ');
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));

    });
  }


  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void ChangeRegisterPasswordVisibility(){

    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off;
    emit(ShopChangeRegisterPasswordVisibilityState());
  }

}