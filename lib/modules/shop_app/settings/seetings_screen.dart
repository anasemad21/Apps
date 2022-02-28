import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/layout/shop_app/cubit/statess.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          // if(state is ShopSuccessUserDataState)
          //   {
          //     nameController.text=state.loginModel.data!.name!;
          //     emailController.text=state.loginModel.data!.email!;
          //     phoneController.text=state.loginModel.data!.phone!;
          //   }
        },
        builder: (context, state) {
          var model=ShopCubit.get(context).userModel;
          nameController.text=model!.data!.name!;
          emailController.text=model.data!.email!;
          phoneController.text=model.data!.phone!;

          return ConditionalBuilder(
            condition: ShopCubit.get(context).userModel !=null,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [

                    if(state is ShopLoadingUpdateUserState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormField(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.person,
                      controller: nameController,
                      label: 'Name',
                      type: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormField(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.email,
                      controller: emailController,
                      label: 'Email',
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormField(
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.phone,
                      controller: phoneController,
                      label: 'Phone',
                      type: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defultButton(
                      function: () {
                        signOut(context);
                      },
                      text: 'Logout',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defultButton(
                      function: () {
                        if(formkey.currentState!.validate()){
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        };
                      },
                      text: 'Update',
                    ),

                  ],
                ),
              ),
            ),
            fallback:(context)=> Center(child: CircularProgressIndicator()),
          );
        },
        );
  }
}
