import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/News_App/Cubit/cubit.dart';
import 'package:project/layout/News_App/Cubit/statess.dart';
import 'package:project/shared/components/components.dart';

class SearchScreen extends StatelessWidget{
  var searchConrtroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state)
     {
       var list =NewCubit.get(context).search;
       return  Scaffold(
         appBar: AppBar(),
         body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: defultTextFormField(controller: searchConrtroller,
                   type: TextInputType.text,
                   label: 'Search',
                   prefix: Icons.search,
                   onChange: (value){
                 NewCubit.get(context).getSearch(value!);
                   },
                   validate: (String? value){
                     if(value!.isEmpty){
                       return'Search must not be empty';
                     }
                     return null;
                   }),
             ),
             Expanded(child: articleBuilder(list, context,isSearch:true,),),

           ],
         ),
       );
     },

   );
  }
  
}