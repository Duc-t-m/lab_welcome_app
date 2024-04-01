import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/home/screens/home.dart';
import 'package:lab_welcome_app/features/welcome/screens/welcome.dart';
import 'package:provider/provider.dart';

import '../models/custom_user.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    if(user.uid.isEmpty) {
      return const WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }
}
