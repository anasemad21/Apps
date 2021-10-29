import 'package:flutter/material.dart';
import 'package:project/shared/components/components.dart';

void Main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Facebook',
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/facebook.png'),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: TextEditingController(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.power_input),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:(){}, child: Text('LOGIN'),),
                  SizedBox(width: 15.0,),
                  ElevatedButton(onPressed:(){}, child: Text('SignUp'),),
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: (){}, child:Text('Forget Password?'), ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
