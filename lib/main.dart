import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/welcome/models/custom_user.dart';
import 'package:lab_welcome_app/features/welcome/screens/auth_wrapper.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'features/welcome/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      initialData: CustomUser(uid: ''),
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
