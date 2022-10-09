import 'package:flutter/material.dart';
import 'package:rare_crew/services/cache_service.dart';
import 'package:rare_crew/view/home_page.dart';
import 'package:rare_crew/view/sign_in_page.dart';
import 'package:rare_crew/view_model/dio_helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheService.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rare Crew',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: CacheService.token != null ? HomeScreen() : LoginScreen(),
       
      );
    });
  }
}
