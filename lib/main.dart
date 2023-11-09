import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/layout/shop_layout.dart';
import 'package:shopapp/modules/login/login_screen.dart';
import 'package:shopapp/modules/onboarding/onboarding_screen.dart';
import 'package:shopapp/shared/network/local/cach_helper.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachHelper.init();

  bool? onBoarding = CachHelper.getData(key: 'onBoarding') ?? false;
  String? token = CachHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayoutScreen();
    else
      widget = ShopLoginScreen();
  } else
    widget = OnBoardingScreen();
  runApp(MyApp(
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({super.key, required this.startScreen});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              )),
          home: startScreen,
        ));
  }
}
