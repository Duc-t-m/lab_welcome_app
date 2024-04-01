import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/welcome/screens/register.dart';
import 'package:lab_welcome_app/features/welcome/services/auth.dart';
import 'package:lab_welcome_app/features/welcome/widgets/password_input_field.dart';
import 'package:lab_welcome_app/features/welcome/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final AuthService _auth = AuthService();
  String error = '';

  void _callLoginApi() async {
    dynamic result = await _auth.signInByEmail(_emailController.text, _passwordController.text);
    if (result == null) {
      setState(() {
        error = 'Something went wrong. Please try again.';
      });
    } else {
      setState(() {
        error = '';
      });
      Navigator.popUntil(
          context,
          ModalRoute.withName(Navigator.defaultRouteName)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 75, left: 20, right: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  TextInputField(
                      iconData: Icons.mail_outline,
                      hintText: 'Email',
                      controller: _emailController
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInputField(
                      iconData: Icons.lock_outline,
                      hintText: 'Password',
                      controller: _passwordController
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xff323142),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Urbanist'),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    child: TextButton(
                      onPressed: _callLoginApi,
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff47477d),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create New Account?',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist'
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              color: Color(0xff47477d),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist'
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 75,),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
}
