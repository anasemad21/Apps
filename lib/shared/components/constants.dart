// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=fd84f3536cfc4e3a9624feed2a2f40a7


import 'package:project/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cash_helper.dart';

void signOut(context)
{
  CashHelper.removeData(key:'token').then((value) {
    if(value)
    {
      navigatAndFinish(context,ShopLoginScreen(),);
    }
  });
}




void printFullText(String text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}


String? token;
String? Uid;