import 'package:firebase/features/auth/auth_service.dart';
import 'package:firebase/features/auth/login.dart';
import 'package:firebase/features/auth/signup.dart';
import 'package:flutter/material.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController signUPEmailController = TextEditingController();

  bool _isLogin = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(      
        children: [
          Image.asset(
            'assets/images/mani.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(color: const Color.fromARGB(146, 0, 0, 0)),

          Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: _isLogin? Colors.blueGrey:Colors.transparent,),
                        child: Text("Login"),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = false;
                          });
                        },
                          style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: _isLogin? Colors.blueGrey:Colors.transparent,),
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _isLogin
                      ? Login(
                          authService: authService,
                          emailController: emailController,
                          passwordController: passwordController,
                        )
                      : SignUp(
                          confirmPasswordController: confirmPasswordController,
                          fullNameController: fullNameController,
                          passwordController: passwordController,
                          signUPEmailController: signUPEmailController,
                          authService: authService,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
