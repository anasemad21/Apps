import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/layout/shop_app/cubit/statess.dart';
import 'package:project/models/shop_app/favourites_model.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        //print("cout<<${ShopCubit.get(context).favouritesModel!.data.data![0]}");
        //var cuu=ShopCubit.get(context).favouritesModel!.data.data!;
        return ConditionalBuilder(
          condition: state is! ShopGetLoadingFavouritesState,
          builder:(context)=> ListView.separated(
            itemBuilder: (context,index)=>buildListProduct(ShopCubit.get(context).favouritesModel!.data!.data![index].product,context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount:ShopCubit.get(context).favouritesModel!.data!.data!.length ,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    ) ;

  }



}
