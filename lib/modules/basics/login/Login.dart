
import 'package:flutter/material.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword=true;

  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.indigoAccent,
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formkey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //color: Colors.teal,
                    child:
                    defultTextFormField(
                      controller: nameController,
                      label: 'Name',
                      prefix: Icons.person,
                      type:   TextInputType.text,
                      validate: (String? value){
                        if(value!.isEmpty){
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  defultTextFormField(
                    controller: passwordController,
                    label: 'Password',
                    prefix: Icons.lock,
                    surfix:isPassword? Icons.visibility:Icons.visibility_off,
                    isPassword: isPassword ,
                    suffixonpressed: (){
                      setState(() {
                        isPassword=!isPassword;
                      });
                    },
                    type: TextInputType.visiblePassword,
                    validate: (String ?value){
                      if(value!.isEmpty){
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 40.0,),
                  defultButton(text: 'login',
                    radius: 10.0,
                    function: (){
                    if(formkey.currentState!.validate()){
                      print(
                          nameController.text
                      );
                      print(
                          passwordController.text
                      );
                    }
                    },
                  ),
                  SizedBox(height: 10.0,),

                  defultButton(text: 'login',
                    radius: 50,
                    background: Colors.teal,
                    function: (){
                      if(formkey.currentState!.validate()){
                        print(
                            nameController.text
                        );
                        print(
                            passwordController.text
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      defultTextButton(
                        function:(){},
                        text:'Register Now ',
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

  }
}