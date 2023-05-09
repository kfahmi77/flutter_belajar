import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAuthWidget extends StatelessWidget {
  const HomeAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

// Mengambil semua pengguna yang terdaftar di Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

// If there is a current user, print their data
    if (user != null) {
      print('User email: ${user.email}');
      print('User name: ${user.displayName}');
      print('User ID: ${user.uid}');
      print('Gambar profil: ${user.photoURL}');
      // And so on
    } else {
      print('No user is currently signed in');
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Image.network(
                "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1194&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
