import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/di_container.dart';
import 'package:talksy/features/splash/controller/splash_screen_controller.dart';
import 'package:talksy/features/splash/screen/splash_screen.dart';
import 'package:talksy/theme/controller/theme_controller.dart';
import 'package:talksy/theme/dark_theme.dart';
import 'package:talksy/theme/litght_theme.dart';
import 'package:talksy/util/images.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dioInit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(sp: sl<SharedPreferences>()),
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
      );
    });
  }
}
class Get{
  static BuildContext? get context=>navigatorKey.currentContext;
  static NavigatorState? get currentState=>navigatorKey.currentState;
}