import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'features/chat/controller/chat_page_controller.dart';
import 'features/home/controller/home_page_controller.dart';
import 'features/intro/controller/intro_screen_controller.dart';
import 'features/userprofile/controller/user_profile_controller.dart';
import 'features/videocall/controller/video_screen_controller.dart';
import 'notification/notification_handler.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void REMAINTODO() {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationHandler().initialize();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await dioInit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenController(sp: sl(),splashServiceInterface: sl()),
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
          create: (context) => AuthController(sp: sl(),authServicesInterface: sl()),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(homeServicesInterface: sl(),sp: sl()),
        ), ChangeNotifierProvider(
          create: (context) => ChatPageController(),
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

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get currentState => navigatorKey.currentState;
}
//{
//     "_id": "67cfd16a134f8e78445a38fb",
//     "u_email": "dfachara7@gmail.com",
//     "u_name": "Darshit",
//     "u_photo": "https://cubanvr.com/wp-content/uploads/2023/07/ai-image-generators.webp",
//     "u_activestatus": 0,
//     "createdAt": "2025-03-11T06:00:10.854Z",
//     "updatedAt": "2025-03-11T06:00:10.854Z",
//     "__v": 0
// }


//.the cheack