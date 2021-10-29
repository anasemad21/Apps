import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/News_App/Cubit/cubit.dart';
import 'package:project/layout/News_App/Cubit/statess.dart';
import 'package:project/modules/news_app/search/search_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit=NewCubit.get(context);
       return Scaffold(
         appBar: AppBar(
           title: Text(
             'News ',
           ),
           actions: [
             IconButton(
                 icon: Icon(Icons.search,),
                 onPressed: (){
                   navigatTo(context, SearchScreen(),);
                 },
             ),
             IconButton(
               icon: Icon(Icons.brightness_4_outlined,),
               onPressed: (){
                 AppCubit.get(context).changeThemeMode();
               },
             ),
           ],
         ),
         body: cubit.screens[cubit.currentindex],
         bottomNavigationBar: BottomNavigationBar(
           items: cubit.BottomItem,
           currentIndex: cubit.currentindex,
           onTap: (index){
             cubit.changeNavBar(index);
       },
         ),
       );
     },
   );
  }

}