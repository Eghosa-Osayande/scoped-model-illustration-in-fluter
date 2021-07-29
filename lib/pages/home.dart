import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ytv/scoped_models/user_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = ScopedModel.of<UserModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${user.name} !!!'),
            Text(user.age),
            Text(user.email),
            Text(user.gender),
            TextButton(
              onPressed: () {
                user.logOut();
              },
              child: Text('LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }
}
