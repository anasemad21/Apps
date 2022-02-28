import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/News_App/Cubit/cubit.dart';
import 'package:project/layout/News_App/Cubit/statess.dart';
import 'package:project/shared/components/components.dart';

class SportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewCubit.get(context).sports;
        return articleBuilder(list,context);
      },
    );
  }

}