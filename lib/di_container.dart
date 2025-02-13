import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/temp/controller/controller.dart';
import 'package:talksy/main.dart';
import 'package:talksy/theme/controller/theme_controller.dart';

  final GetIt sl = GetIt.instance;

Future<void> dioInit() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  //sp
  sl.registerLazySingleton<SharedPreferences>(() => sp);
  //theme
  sl.registerLazySingleton<ThemeController>(() => ThemeController(sp: sl()));
  //splash
  sl.registerLazySingleton(() => SplashScreenController());

}
