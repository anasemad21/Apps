
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/modules/shop_app/register/register_screen.dart';
import 'package:project/modules/shop_app/shop_login/cubit/cubit_shop_login_app.dart';
import 'package:project/modules/shop_app/shop_login/cubit/statess_shop_login_app.dart';
import 'package:project/shared/components/components.dart';

class ShopLoginScreen extends StatelessWidget{

  var formkeyshopapp=GlobalKey<FormState>();
  var emailControllershopapp=TextEditingController();
  var passwordControllershopapp=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=>ShopLoginCubit(),
        child:BlocConsumer<ShopLoginCubit,ShopLoginStates>(
          listener: (context,state){
            if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status!)
              {
                print(state.loginModel.message);
                print(state.loginModel.data!.token);
                print(state.loginModel.message);
                Fluttertoast.showToast(
                    msg:state.loginModel.message!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else{
                print(state.loginModel.message);
                Fluttertoast.showToast(
                    msg:state.loginModel.message!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }

            }
          },
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(title: Center(child: Text('Login Page')),),
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
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Login now to browse our offers',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(color:Colors.grey,),

                          ),
                          SizedBox(height: 30.0,),

                          defultTextFormField(
                            controller:emailControllershopapp,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.0,),

                          defultTextFormField(
                            controller:passwordControllershopapp,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            surfix: ShopLoginCubit.get(context).suffix,
                            suffixonpressed: (){
                              ShopLoginCubit.get(context).ChangePasswordVisibility();
                            },
                            onSubmit: (value){
                              if(formkeyshopapp.currentState!.validate())
                              {
                                print(emailControllershopapp.text);
                                print(passwordControllershopapp.text);

                                ShopLoginCubit.get(context).userLogin(
                                  email: emailControllershopapp.text,
                                  password: passwordControllershopapp.text,
                                );
                              }
                            },
                            validate: (String ?value){
                              if(value!.isEmpty){
                                return 'Password is too short';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0,),

                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder:(context)=>defultButton(
                              text: 'login',
                              isUpperCase: true,
                              function: (){
                                if(formkeyshopapp.currentState!.validate())
                                {
                                  //   print(emailControllershopapp.text);
                                  // print(passwordControllershopapp.text);
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailControllershopapp.text,
                                    password: passwordControllershopapp.text,
                                  );
                                }
                                //else{print('null');}
                              },
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(height: 15.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'don\'t have an account',
                              ),
                              defultTextButton(
                                function:(){
                                  navigatTo(context,RegisterScreen(),);
                                },
                                text:'register',
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
        )

    );
  }

}