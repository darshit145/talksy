import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/auth/domain/repo/auth_repo.dart';
import 'package:talksy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:talksy/features/auth/domain/services/auth_services.dart';
import 'package:talksy/features/auth/domain/services/auth_services_interface.dart';
import 'package:talksy/features/home/domain/repo/home_repo.dart';
import 'package:talksy/features/home/domain/repo/home_repo_interface.dart';
import 'package:talksy/features/home/domain/services/home_services.dart';
import 'package:talksy/features/home/domain/services/home_services_interface.dart';
import 'package:talksy/features/userprofile/controller/user_profile_controller.dart';
import 'package:talksy/theme/controller/theme_controller.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/home/controller/home_page_controller.dart';
import 'features/splash/controller/splash_screen_controller.dart';
import 'features/videocall/controller/video_screen_controller.dart';

  final GetIt sl = GetIt.instance;

Future<void> dioInit() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  //sp
  sl.registerLazySingleton<SharedPreferences>(() => sp);
  //theme
  sl.registerLazySingleton<ThemeController>(() => ThemeController(sp: sl()));
  //splash
  sl.registerLazySingleton(() => SplashScreenController(sp: sl()));
  //Auth
  sl.registerLazySingleton<AuthRepoInterface>(() => AuthRepo());
  sl.registerLazySingleton<AuthServicesInterface>(() => AuthServices(repoInterface: sl()));
  sl.registerLazySingleton(() => AuthController(sp: sl(), authServicesInterface: sl()));

  //Profile Screen Controller
  sl.registerLazySingleton(() => UserProfileController(sp: sl()),);

  //FOR Video Call
  sl.registerLazySingleton(() => VideoScreenController(),);

  //homePage
  sl.registerLazySingleton<HomeRepoInterface>(() => HomeRepo());
  sl.registerLazySingleton<HomeServicesInterface>(() => HomeServices(repoInterface: sl()));
  sl.registerLazySingleton(() => HomePageController(homeServicesInterface: sl(),sp: sl()),);


}
