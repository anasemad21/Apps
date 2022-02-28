import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/cubit/statess.dart';
import 'package:project/models/shop_app/categories_model.dart';
import 'package:project/models/shop_app/change_favourite_model.dart';
import 'package:project/models/shop_app/favourites_model.dart';
import 'package:project/models/shop_app/home_model.dart';
import 'package:project/models/shop_app/login_shop_app.dart';
import 'package:project/modules/shop_app/categories/categories_screen.dart';
import 'package:project/modules/shop_app/favourites/favourites_screen.dart';
import 'package:project/modules/shop_app/products/products_screen.dart';
import 'package:project/modules/shop_app/settings/seetings_screen.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/network/end_point.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    FavouritesScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(
      ShopChangeBottomNavState(),
    );
  }

  HomeModel? homeModel;

  Map<int?,bool?>? favourites={};
  void getHomeData() {
    emit(
      ShopLoadingHomeState(),);
    DioHelperShopApp.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element)
      {
        favourites!.addAll({
          element.id:element.inFavorites,
        });
      });
      //print(favourites.toString());
      //print(homeModel.status);
      //printFullText(homeModel.data.banners[0].image);
      emit(
        ShopSuccessHomeState(),
      );
    }).catchError((error) {
      print('Error in getHomeData :');
      print(
        error.toString(),
      );
      emit(
        ShopErrorHomeState(
          error.toString(),
        ),
      );
    });
  }


bool changeFaveColor(int? id)
{
  if(favourites![id]==true)
    return true;
  else
    return false;

}

  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelperShopApp.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      //print(homeModel.status);
      //printFullText(homeModel.data.banners.toString());
      emit(
        ShopSuccessCategoriesState(),
      );
    }).catchError((error) {
      print('Error in getCategories :');
      print(
        error.toString(),
      );
      emit(
        ShopErrorCategoriesState(
          error.toString(),
        ),
      );
    });
  }
  ChangeFavouritesModel?  changeFavouritesModel ;

  void changeFavourites(int? productId) {
    if(favourites![productId]==true)
       favourites![productId]=false;
    else
      favourites![productId]=true;
    emit(
      ShopFavouritesState(),
    );
    DioHelperShopApp.PostData(
      url: FAVOURITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavouritesModel=ChangeFavouritesModel.fromJson(value.data);
      //print('anaaaaaaaaaaas');
      //print(value.data);
      if(!changeFavouritesModel!.status)
        {
          if(favourites![productId]==true)
            favourites![productId]=false;
          else
            favourites![productId]=true;
        }
      else{
        getFavourites();
      }
      emit(
        ShopSuccessFavouritesState(changeFavouritesModel!),
      );
    }).catchError((error) {
      if(favourites![productId]==true)
        favourites![productId]=false;
      else
        favourites![productId]=true;
      print('Error in changeFavourites:');
      emit(ShopErrorFavouritesState(error),

      );
    });
  }



  FavouritesModel? favouritesModel;
  void getFavourites() {
    emit(ShopGetLoadingFavouritesState());
    DioHelperShopApp.getData(
      url: FAVOURITES,
      token: token,
    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      //print(homeModel.status);
      printFullText("DataValue:${value.data.toString()}");
      emit(
        ShopSuccessGetFavouritesState(),
      );
    }).catchError((error) {
      print('Error in getFavourites :');
      print(
        error.toString(),
      );
      emit(
        ShopErrorGetFavouritesState(
          error.toString(),
        ),
      );
    });
  }



  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelperShopApp.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      //print(homeModel.status);
      //printFullText(userModel!.data!.name!);
      //printFullText(userModel!.data!.email!);
      emit(
        ShopSuccessUserDataState(userModel!),
      );
    }).catchError((error) {
      print('Error in getUserData :');
      print(
        error.toString(),
      );
      emit(
        ShopErrorUserDataState(
          error.toString(),
        ),
      );
    });
  }


  void updateUserData({
  required String name,
    required String email,
    required String phone,
}) {
    emit(ShopLoadingUpdateUserState());
    DioHelperShopApp.putData(
      data: {
        'name':name,
        'email':email,
        'phone':phone,
      },

      url: UPDATE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      //print(homeModel.status);
      //printFullText(userModel!.data!.name!);
      //printFullText(userModel!.data!.email!);
      emit(
        ShopSuccessUpdateUserState(userModel!),
      );
    }).catchError((error) {
      print('Error in Update UserData :');
      print(
        error.toString(),
      );
      emit(
        ShopErrorUpdateUserState(
          error.toString(),
        ),
      );
    });
  }

}



