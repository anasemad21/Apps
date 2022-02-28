import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/social_app/social_layout.dart';
import 'package:project/modules/social_app/social_login/cubit/cubit_social_login_app.dart';
import 'package:project/modules/social_app/social_register/social_register_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cash_helper.dart';

import 'cubit/statess_social_login_app.dart';

class  SocialLoginScreen extends StatelessWidget
{

  var formkeySocialapp = GlobalKey<FormState>();
  var emailControllerSocialapp = TextEditingController();
  var passwordControllerSocialapp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialLoginCubit(),
      
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener: (context,state){
          if(state is SocialLoginErrorState)
            {
              showToast(text: state.error, state: ToastState.Error,);
            }
          if(state is SocialLoginSuccessState)
            {
              CashHelper.saveData(
                key: 'Uid',
                value: state.Uid,
              ).then((value) {
                navigatAndFinish(
                  context,
                  SocialLayout(),
                );
              });
            }
        },
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Login Page')),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkeySocialapp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style:
                          Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login now to communicate with friends',
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultTextFormField(
                          controller: emailControllerSocialapp,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextFormField(
                          controller: passwordControllerSocialapp,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          surfix: SocialLoginCubit.get(context).suffix,
                          suffixonpressed: () {
                            SocialLoginCubit.get(context)
                                .ChangePasswordVisibility();
                          },
                          onSubmit: (value) {
                            // if (formkeySocialapp.currentState!.validate()) {
                            //   print(emailControllerSocialapp.text);
                            //   print(passwordControllerSocialapp.text);
                            //
                            //   SocialLoginCubit.get(context).userLogin(
                            //     email: emailControllerSocialapp.text,
                            //     password: passwordControllerSocialapp.text,
                            //   );
                            // }
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defultButton(
                            text: 'login',
                            isUpperCase: true,
                            function: () {
                              if (formkeySocialapp.currentState!.validate()) {
                                  print(emailControllerSocialapp.text);
                                print(passwordControllerSocialapp.text);
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailControllerSocialapp.text,
                                  password: passwordControllerSocialapp.text,
                                );
                              }
                              else{print('null');}
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'don\'t have an account',
                            ),
                            defultTextButton(
                              function: () {
                                navigatTo(
                                  context,
                                  SocialRegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
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