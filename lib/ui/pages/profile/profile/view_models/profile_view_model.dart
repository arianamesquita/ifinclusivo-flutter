
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';

class ProfileViewModel extends ChangeNotifier{
  final AuthRepository _authRepository;
  final ForumRepository _forumRepository;

  ProfileViewModel({required AuthRepository authRepository, required ForumRepository forumRepository}) : _authRepository = authRepository, _forumRepository = forumRepository;
}