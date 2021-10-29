import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/News_App/news_layout.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/shared/cubit/cubit_todo_app.dart';
import 'package:project/shared/cubit/statess_todo_app.dart';
import 'package:project/shared/network/local/cash_helper.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'package:project/shared/network/remote/dio_helper_shop_app.dart';
import 'package:project/shared/styles/themes.dart';

import 'layout/News_App/Cubit/cubit.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

void main() async {
  //بيتاكد ان كل حاجه في الميثود خلصت وبعدين يفتح الابليكشن يعني يرن app
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  //DioHelper.init();
  DioHelperShopApp.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

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
          create: (context) => AppCubit()..changeThemeMode(
            fromShared: isDark,
          ),
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
            home: OnBoardingScreen(),
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
