import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/News_App/news_layout.dart';
import 'package:project/layout/shop_app/cubit/cubit.dart';
import 'package:project/layout/shop_app/shop_layout.dart';
import 'package:project/layout/social_app/cubit/cubit.dart';
import 'package:project/layout/social_app/social_layout.dart';
import 'package:project/modules/native_code.dart';
import 'package:project/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:project/modules/social_app/social_login/social_login_screen.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/cubit/statess_todo_app.dart';
import 'package:project/shared/network/local/cash_helper.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';
import 'package:project/shared/styles/themes.dart';

import 'layout/News_App/Cubit/cubit.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)async
// {
//   print('on background message ');
//   print(message.data.toString());
//   showToast(text: 'on background message ', state: ToastState.Success,);
//
// }
void main() async {
  //بيتاكد ان كل حاجه في الميثود خلصت وبعدين يفتح الابليكشن يعني يرن app
   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   var token= await FirebaseMessaging.instance.getToken();
//   print(" my token:");
//   print(token);
// //Foreground FCM
//   // firebase cloud messaging
//   FirebaseMessaging.onMessage.listen((event) {
//     print("on message:");
//     print(event.data.toString());
//     showToast(text: 'on message', state: ToastState.Success,);
//   });
// //when click on notification to open app
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     print('on message opened app');
//     print(event.data.toString());
//     showToast(text: 'on message opened app', state: ToastState.Success,);
//   });
//   //background FCM
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //DioHelperShopApp.init();
  await CashHelper.init();



  bool? isDark = CashHelper.getData(key: 'isDark');
  Widget widget;

  //bool? onBoarding = CashHelper.getData(key: 'onBoarding');
   //token = CashHelper.getData(key: 'token');
   //print(token);
    Uid = CashHelper.getData(key: 'Uid');

  //
  // if(onBoarding!=null){
  //   if(token!=null) widget=ShopLayout();
  //   else widget=ShopLoginScreen();
  // }
  // else{
  //   widget=OnBoardingScreen();
  // }
  //print(onBoarding);

  if(Uid !=null)
    {
      widget=SocialLayout();
    }
  else
    {
      widget=SocialLoginScreen();
    }

  runApp(MyApp(
    startWidget:widget,
    isDark:isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    required this.startWidget,
});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
        ),
        BlocProvider(
            create: (context) => ShopCubit()..getHomeData()..getCategories()..getFavourites()..getUserData() ,
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getUserData()..getPosts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
           // themeMode: ThemeMode.dark,
            home:NativeCodeScreen(),
            //startWidget,
            //NewLogin(),
           //NewsLayout(),
            //CounterScreen(),
            //HomeLayout(),
            //Login(),
            //BmiScreen(),
            //MessengerScreen(),
          );
        },
      ),
    );
  }
}
