import 'package:talksy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:talksy/features/auth/domain/services/auth_services_interface.dart';

class AuthServices extends AuthServicesInterface{
  final AuthRepoInterface repoInterface;
  AuthServices({required this.repoInterface});

}