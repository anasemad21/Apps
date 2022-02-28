import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/shop_app/shop_layout.dart';
import 'package:project/modules/shop_app/register/cubit/statess_shop_register_app.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/network/local/cash_helper.dart';

import 'cubit/cubit_shop_register_app.dart';

class RegisterScreen extends StatelessWidget
{
  var formkeyshopapp = GlobalKey<FormState>();
  var emailControllershopapp = TextEditingController();
  var passwordControllershopapp = TextEditingController();
  var nameControllershopapp = TextEditingController();
  var phoneControllershopapp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context,state){
          if (state is ShopRegisterSuccessState) {
            if (state.RegisterModel.status!) {
              print(state.RegisterModel.message);
              print(state.RegisterModel.data!.token);
              print(state.RegisterModel.message!);
              CashHelper.saveData(
                key: 'token',
                value: state.RegisterModel.data!.token,
              ).then((value) {
                token=state.RegisterModel.data!.token!;
                navigatAndFinish(
                  context,
                  ShopLayout(),
                );
              });
            } else {
              print(state.RegisterModel.message!);
              showToast(
                state: ToastState.Warning,
                text: state.RegisterModel.message!,
              );
            }
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkeyshopapp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style:
                          Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to browse our offers',
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormField(
                          controller: nameControllershopapp,
                          type: TextInputType.name,
                          label: 'User Name',
                          prefix: Icons.person,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextFormField(
                          controller: emailControllershopapp,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          surfix: ShopRegisterCubit.get(context).suffix,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormField(
                            controller: passwordControllershopapp,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            prefix: Icons.lock_outlined,
                            isPassword: ShopRegisterCubit.get(context).isPassword,
                            surfix: ShopRegisterCubit.get(context).suffix,
                            suffixonpressed: (){
                              ShopRegisterCubit.get(context)
                                  .ChangeRegisterPasswordVisibility();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password ';
                              }
                              return null;
                            },
                            onSubmit: (value)
                            {
                            }

                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormField(
                          controller: phoneControllershopapp,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defultButton(
                            text: 'register',
                            isUpperCase: true,
                            function: () {
                              if (formkeyshopapp.currentState!.validate()) {
                                //   print(emailControllershopapp.text);
                                // print(passwordControllershopapp.text);
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameControllershopapp.text,
                                  phone: phoneControllershopapp.text,
                                  email: emailControllershopapp.text,
                                  password: passwordControllershopapp.text,
                                );
                              }
                              //else{print('null');}
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}