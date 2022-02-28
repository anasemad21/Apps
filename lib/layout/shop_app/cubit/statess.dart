import 'package:project/models/shop_app/change_favourite_model.dart';
import 'package:project/models/shop_app/login_shop_app.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeState extends ShopStates{}

class ShopSuccessHomeState extends ShopStates{}

class ShopErrorHomeState extends ShopStates{
  final String error;
  ShopErrorHomeState(this.error);
}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriesState extends ShopStates{
  final String error;
  ShopErrorCategoriesState(this.error);
}

class ShopFavouritesState extends ShopStates{}

class ShopSuccessFavouritesState extends ShopStates{
  final ChangeFavouritesModel model;
  ShopSuccessFavouritesState(this.model);
}

class ShopErrorFavouritesState extends ShopStates{
  final String error;
  ShopErrorFavouritesState(this.error);
}

class ShopSuccessGetFavouritesState extends ShopStates{}

class ShopErrorGetFavouritesState extends ShopStates{
  final String error;
  ShopErrorGetFavouritesState(this.error);
}



class ShopGetLoadingFavouritesState extends ShopStates{}



class ShopLoadingUserDataState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates{
 final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates{
  final String error;
  ShopErrorUserDataState(this.error);
}



class ShopLoadingUpdateUserState extends ShopStates{}

class ShopSuccessUpdateUserState extends ShopStates{
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates{
  final String error;
  ShopErrorUpdateUserState(this.error);
}