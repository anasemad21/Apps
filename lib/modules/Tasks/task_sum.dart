import 'dart:io';

import 'dart:typed_data';
void main(){
  int sum=0;
  bool flag=true;
  int conter=1;
  print('Enter Number $conter:');
  int? cin=int.parse(stdin.readLineSync()!);
  sum+=cin;
  conter++;
  print('Enter Number $conter:');
  int? ciin=int.parse(stdin.readLineSync()!);
  sum+=ciin;
  while(flag=true){
    print('You need to enter another number?');
    String ?user = stdin.readLineSync()!;
    if(user=='yes'||user=='Yes'){
      conter++;
      print('Enter Number $conter');
      int ?cin=int.parse(stdin.readLineSync()!);
      sum+=cin;
      //continue;
    }
    else if (user=='no'||user=='No'){
      flag=false;
      break;
    }
  }
  print('sum of value $sum');

}