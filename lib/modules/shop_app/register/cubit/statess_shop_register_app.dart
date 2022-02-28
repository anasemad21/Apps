

import 'package:project/models/shop_app/login_shop_app.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates
{
  final ShopLoginModel RegisterModel;

  ShopRegisterSuccessState(this.RegisterModel);
}

class ShopRegisterErrorState extends ShopRegisterStates {
  final String error;
  ShopRegisterErrorState(this.error);

}
class ShopChangeRegisterPasswordVisibilityState extends ShopRegisterStates {}