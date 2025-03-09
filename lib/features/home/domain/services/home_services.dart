
import 'package:talksy/features/home/domain/repo/home_repo_interface.dart';

import 'home_services_interface.dart';

class HomeServices extends HomeServicesInterface{
  final HomeRepoInterface repoInterface;
  HomeServices({required this.repoInterface});

  @override
  Future<String> getAllUser() {
     return repoInterface.getAllUser();
  }

}