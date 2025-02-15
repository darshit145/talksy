import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/auth/domain/repo/auth_repo.dart';
import 'package:talksy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:talksy/features/auth/domain/services/auth_services.dart';
import 'package:talksy/features/auth/domain/services/auth_services_interface.dart';
import 'package:talksy/theme/controller/theme_controller.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/splash/controller/splash_screen_controller.dart';

  final GetIt sl = GetIt.instance;

Future<void> dioInit() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  //sp
  sl.registerLazySingleton<SharedPreferences>(() => sp);
  //theme
  sl.registerLazySingleton<ThemeController>(() => ThemeController(sp: sl()));
  //splash
  sl.registerLazySingleton(() => SplashScreenController());
  //Auth
  sl.registerLazySingleton<AuthRepoInterface>(() => AuthRepo());
  sl.registerLazySingleton<AuthServicesInterface>(() => AuthServices(repoInterface: sl()));
  sl.registerLazySingleton(() => AuthController());


}
