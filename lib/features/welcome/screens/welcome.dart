import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/welcome/screens/login.dart';
import 'package:lab_welcome_app/features/welcome/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: const Text(
                    'Welcome to RISCS Lab',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 250,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 60,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen())
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff47477d),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 60,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen())
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffe3e3e3),
                      foregroundColor: const Color(0xffb1b1b1),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Sign up'),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Continue With Accounts',
                style: TextStyle(
                    color: Color(0xffacadb9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0x44d44638),
                            foregroundColor: const Color(0xffd44638),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('GOOGLE'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0x444267B2),
                              foregroundColor: const Color(0xff4267B2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text('FACEBOOK')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

