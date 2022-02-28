import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/shop_app/search/cubit/cubit.dart';
import 'package:project/modules/shop_app/search/cubit/statess.dart';
import 'package:project/shared/components/components.dart';

class SearchScreen extends StatelessWidget
{
  var formKey=GlobalKey<FormState>();
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defultTextFormField(
                      onSubmit: (dynamic text){
                        SearchCubit.get(context).search(text);
                      },
                        controller:searchController ,
                        type: TextInputType.text,
                        label: 'Search',
                        prefix:Icons.search,
                        validate: (String? value){
                          if(value!.isEmpty)
                            {
                              return 'Enter text to search about it';
                            }
                            return null ;
                        },
                ),
                    SizedBox(height: 10.0,),
                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(height: 10.0,),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index)=>buildListProduct(SearchCubit.get(context).model!.data!.data![index],context,isOldPrice: false,),
                        separatorBuilder: (context,index)=>myDivider(),
                        itemCount:SearchCubit.get(context).model!.data!.data!.length,
                      ),
                    ),
                  ],

                ),
              ),
            ),
          );
        },

      ),
    );
  }

}