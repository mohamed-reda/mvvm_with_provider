import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'user_view_model.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});

  final userViewModel = UserViewModel(
    userRepo: UserRepository(
      prefs: await SharedPreferences.getInstance(),
    ),
  );
  await userViewModel.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>.value(value: userViewModel),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    ),
  );
}
