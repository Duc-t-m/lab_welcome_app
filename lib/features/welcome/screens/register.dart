import 'package:flutter/material.dart';
import 'package:lab_welcome_app/features/welcome/screens/login.dart';
import 'package:lab_welcome_app/features/welcome/services/auth.dart';
import 'package:lab_welcome_app/features/welcome/widgets/password_input_field.dart';
import 'package:lab_welcome_app/features/welcome/widgets/text_input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String error = '';

  void _callRegisterApi() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    dynamic result = await _authService.signUpByEmail(
        _emailController.text, _passwordController.text);
    if (result == null) {
      setState(() {
        error = 'Something went wrong, please try again later.';
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
                      'Create your Account',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextInputField(
                          iconData: Icons.person_outline,
                          hintText: 'User Name',
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputField(
                          iconData: Icons.email_outlined,
                          hintText: 'Email',
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputField(
                          iconData: Icons.person_outline,
                          hintText: 'Address',
                          controller: _addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PasswordInputField(
                          iconData: Icons.lock_outline,
                          hintText: 'Password',
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextButton(
                            onPressed: _callRegisterApi,
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff47477d),
                                foregroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('Register'),
                          ),
                        ),
                        Text(error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14)),
                      ],
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
                        'Already Have An Account?',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Color(0xff47477d),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist'),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 75,
                  ),
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
                    fontFamily: 'Urbanist'),
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
    _usernameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
  }
}
