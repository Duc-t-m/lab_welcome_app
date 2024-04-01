import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/welcome/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthService _auth = AuthService();

  void _callLogoutApi() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _callLogoutApi,
          ),
          const SizedBox(width: 30,),
        ],
      ),
      body: const Center(
        child: Text('Home', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
