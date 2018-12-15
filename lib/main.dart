import 'package:flutter/material.dart';
import 'views/ChatList/ChatList.dart';
import 'views/LoginScreen/LoginScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Whatsapp Clone',
      theme: new ThemeData(
        primaryColor: Colors.teal[900],
      ),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return new ChatList();
            // return new ChatList(uuid: snapshot.data.uid);
          }
          return LoginScreen();
        }
      },
    );
  }
}
