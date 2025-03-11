import 'package:talksy/features/splash/domain/repo/splash_repo_interface.dart';
import 'package:talksy/features/splash/domain/services/splash_service_interface.dart';

class SplashService extends SplashServiceInterface{
  SplashRepoInterface splashRepoInterface;
  SplashService({required this.splashRepoInterface});

  @override
  Future<String> getConfig() {
    // TODO: implement getConfig
    return splashRepoInterface.getConfig();
  }

}