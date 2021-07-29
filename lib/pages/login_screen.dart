import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ytv/scoped_models/user_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are Logged Out'),
            TextFormField(
              initialValue: "sample@gmail.com",
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              initialValue: "1234567",
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            ScopedModelDescendant<UserModel>(
            builder: (context, widget, user) {
                return (user.isLoaded)?TextButton(
                  onPressed: () {
                    user.loginUser('email', 'password');
                  },
                  child: Text("LOGIN"),
                  
                ):CircularProgressIndicator();
              }
            ),
          ],
        ),
      ),
    );
  }
}
