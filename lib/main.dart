import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:otlob_task/bloc/login_cubit.dart';
import 'package:otlob_task/providers/category_provider.dart';
import 'package:otlob_task/providers/item_Provider.dart';
import 'package:otlob_task/providers/resturant_provider.dart';

import 'package:otlob_task/screens/splash_screen.dart';

import 'package:provider/provider.dart';

import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.int();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: ResturantsProvider()),
        ChangeNotifierProvider.value(value: ItemProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: HexColor('#46200B'),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Otlob Task',
        home: Directionality(textDirection: TextDirection.rtl, child: SplashScreen()),
      ),
    );
  }
}
