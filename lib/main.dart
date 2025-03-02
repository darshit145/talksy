import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/component/routs.dart';
import 'package:talksy/di_container.dart';
import 'package:talksy/features/splash/controller/splash_screen_controller.dart';
import 'package:talksy/features/splash/screen/splash_screen.dart';
import 'package:talksy/theme/controller/theme_controller.dart';
import 'package:talksy/theme/dark_theme.dart';
import 'package:talksy/theme/litght_theme.dart';

import 'features/auth/controller/auth_controller.dart';
import 'features/intro/controller/intro_screen_controller.dart';
import 'features/userprofile/controller/user_profile_controller.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void REMAINTODO(){

}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dioInit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenController(sp: sl()),
        ),
         ChangeNotifierProvider(
          create: (context) => IntroScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProfileController(sp: sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(sp: sl<SharedPreferences>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(sp: sl()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, value, child) {
      // value.isDarkModTheme();
      return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: value.isDarkModTheme() ? darkTheme : lightTheme,
        title: 'Talksy',
        home: SplashScreen(),
        routes: routes,
      );
    });
  }
}
class Get{
  static BuildContext? get context=>navigatorKey.currentContext;
  static NavigatorState? get currentState=>navigatorKey.currentState;
}