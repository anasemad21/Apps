import 'package:flutter/material.dart';

class BMIresult extends StatelessWidget {
  final bool isMale;
  final int result;
  final int age;
  BMIresult({
   required this.isMale,
    required this.age,
    required this.result,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blueGrey[400],
          centerTitle: true,
          title: Text(
            'BMI Result',
            style: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
            ),
          ),
        ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender: ${isMale ?'Male':'Female'}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
            Text('Your Body Mass:$result',
              style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
            Text('Age:$age',
              style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    );
  }
}
