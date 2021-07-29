import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ytv/pages/home.dart';
import 'package:ytv/pages/login_screen.dart';
import 'package:ytv/scoped_models/user_model.dart';

void main() {
  runApp(
    DApp(),
  );
}

class DApp extends StatelessWidget {
  UserModel _user = UserModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: _user,
      child: MaterialApp(
        title: 'Demo',
        home: Scaffold(
          appBar: AppBar(),
          body: ScopedModelDescendant<UserModel>(
            builder: (context, widget, user) {
              if (user.isLoggedIn) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
