import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/bmi_app/bmi_result/BMI_result.dart';
import 'package:project/shared/components/components.dart';

class BmiScreen extends StatefulWidget{

  @override
  _BmiScreenState createState()=> _BmiScreenState();
}
class _BmiScreenState extends State<BmiScreen>{
  bool isMale=true;
  double height=50;
  int weight=20;
  int age=12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.black,
            fontWeight:FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.blueGrey[400]: Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           Image(
                             image: AssetImage('assets/images/male.png'),
                             height: 60.0,
                             width: 60.0,
                           ),
                              SizedBox(height: 15.0,),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !isMale? Colors.blueGrey[400]: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              height: 60.0,
                              width: 60.0,
                            ),
                            SizedBox(height: 15.0,),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(
                     'HEIGHT',
                     style: TextStyle(
                       fontSize: 25.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,

                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    Slider(value: height,
                      max:300,
                      min:30,
                      onChanged: (value)
                      {
                        setState(() {
                          height=value;
                        });

                      },
                      activeColor: Colors.brown,
                      inactiveColor: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blueGrey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             FloatingActionButton(onPressed:(){
                               setState(() {
                                 weight--;
                               });
                             },
                               heroTag: 'weight-',
                               mini: true,
                             child: Icon(
                               Icons.remove,
                             ),
                               backgroundColor: Colors.brown,),
                              FloatingActionButton(onPressed:(){
                               setState(() {
                                 weight++;
                               });
                              },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                                backgroundColor: Colors.brown,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blueGrey[400],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                age--;
                              });
                            },
                              heroTag: 'age-',
                              mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                              backgroundColor: Colors.brown,),
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                age++;
                              });
                            },
                              heroTag: 'age+',
                              mini: true,
                              child: Icon(
                                Icons.add,
                              ),
                            backgroundColor: Colors.brown,),
                          ],
                        ),

                      ],
                    ),
                  ),),


                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blueGrey[400],
            child: MaterialButton(onPressed:(){
              var result=weight/pow(height/ 100,2);
              navigatTo(context,BMIresult);
              // Navigator.push(context, MaterialPageRoute(builder:(context)=>BMIresult(
              //   result:result.round(),
              //   age: age,
              //   isMale: isMale,
              // ),
              // ),
              // );
            },
              height: 50.0,
            child: Text(
              'Calculate',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),),
          ),
        ],
      ),
    );

  }
  
}