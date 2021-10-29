import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/News_App/Cubit/statess.dart';
import 'package:project/modules/news_app/business/business_screen.dart';
import 'package:project/modules/news_app/science/science_screen.dart';
import 'package:project/modules/news_app/sports/sports_screen.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

class NewCubit extends Cubit<NewsStates> {
  NewCubit() : super(NewInitialState());

  static NewCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Sciencs',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeNavBar(int index) {
    currentindex = index;
    if (index == 1) SportsScreen();
    if (index == 2) ScienceScreen();

    emit(BottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'fd84f3536cfc4e3a9624feed2a2f40a7',
      },
    ).then((value) {
      //print(value.data['totalResults']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': 'fd84f3536cfc4e3a9624feed2a2f40a7',
          },
        ).then((value) {
          //print(value.data['totalResults']);
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }
    else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {

        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': 'fd84f3536cfc4e3a9624feed2a2f40a7',
          },
        ).then((value) {
          //print(value.data['totalResults']);
          science = value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsGetScienceSuccessState());
      }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q': '$value',
        'apiKey': 'fd84f3536cfc4e3a9624feed2a2f40a7',
      },
    ).then((value) {
      //print(value.data['totalResults']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}
