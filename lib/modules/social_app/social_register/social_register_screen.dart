import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/social_app/social_layout.dart';
import 'package:project/modules/social_app/social_register/cubit/statess_social_register_app.dart';
import 'package:project/shared/components/components.dart';

import 'cubit/cubit_social_register_app.dart';

class SocialRegisterScreen extends StatelessWidget
{
  var formkeysocialapp = GlobalKey<FormState>();
  var emailControllersocialapp = TextEditingController();
  var passwordControllersocialapp = TextEditingController();
  var nameControllersocialapp = TextEditingController();
  var phoneControllersocialapp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context,state){
          if (state is SocialCreateUserSuccessState) {
            navigatAndFinish(context,SocialLayout(),);

            // if (state.RegisterModel.status!) {
            //   print(state.RegisterModel.message);
            //   print(state.RegisterModel.data!.token);
            //   print(state.RegisterModel.message!);
            //   CashHelper.saveData(
            //     key: 'token',
            //     value: state.RegisterModel.data!.token,
            //   ).then((value) {
            //     token=state.RegisterModel.data!.token!;
            //     navigatAndFinish(
            //       context,
            //       SocialLayout(),
            //     );
            //   });
            // } else {
            //   print(state.RegisterModel.message!);
            //   showToast(
            //     state: ToastState.Warning,
            //     text: state.RegisterModel.message!,
            //   );
            // }
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
                    key: formkeysocialapp,
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
                          'Register now to communicate with friends',
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormField(
                          controller: nameControllersocialapp,
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
                          controller: emailControllersocialapp,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          surfix: SocialRegisterCubit.get(context).suffix,
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
                            controller: passwordControllersocialapp,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            prefix: Icons.lock_outlined,
                            isPassword: SocialRegisterCubit.get(context).isPassword,
                            surfix: SocialRegisterCubit.get(context).suffix,
                            suffixonpressed: (){
                              SocialRegisterCubit.get(context)
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
                          controller: phoneControllersocialapp,
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
                          condition: state is! SocialRegisterLoadingState,
                          builder: (context) => defultButton(
                            text: 'register',
                            isUpperCase: true,
                            function: () {
                              if (formkeysocialapp.currentState!.validate()) {
                                   print(emailControllersocialapp.text);
                                 print(passwordControllersocialapp.text);
                                 SocialRegisterCubit.get(context).userRegister(
                                   name: nameControllersocialapp.text,
                                 phone: phoneControllersocialapp.text,
                                  email: emailControllersocialapp.text,
                                  password: passwordControllersocialapp.text,
                                );
                              }
                              else{print('null');}
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