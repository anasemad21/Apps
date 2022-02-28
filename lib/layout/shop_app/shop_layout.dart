import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/layout/shop_app/cubit/statess.dart';
import 'package:project/modules/shop_app/search/search_screen.dart';
import 'package:project/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cash_helper.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shop App',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: (){
                  navigatTo(context,SearchScreen(),);
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap:(index){
              cubit.changeBottom(index);
            } ,
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps,),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
