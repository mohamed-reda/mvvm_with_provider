import 'package:flutter/cupertino.dart';

import 'user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepo;

  UserViewModel({@required this.userRepo});

  String name;
  bool isLoggedIn;

  init() async {
    await _refreshAllStates();
  }

  _refreshAllStates() async {
    isLoggedIn = await userRepo.isLoggedIn();
    name = await userRepo.getName();
    notifyListeners();
  }

  login() async {
    await userRepo.login("Mohamed Reda");
    await _refreshAllStates();
  }

  logout() async {
    await userRepo.logout();
    await _refreshAllStates();
  }
}
