import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/shop_app/search_model.dart';
import 'package:project/modules/shop_app/search/cubit/statess.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/network/end_point.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context)=>BlocProvider.of(context);

  SearchModel? model;
  dynamic text;
  void search(text)
  {
    emit(SearchLoadingState(),);
    print("Text:${text}");
    DioHelperShopApp.PostData(
        url: SEARCH,
        token: token,
        data:{
          'text':text,
        },  
        ).then((value) {
          model=SearchModel.fromJson(value.data);
          print("Search:${value.data}");
          emit(SearchSuccessState(),);
    }).catchError((error){
          print('Error in search:${error.toString()}');
          emit(SearchErrorState(error),);
    });

  }


}