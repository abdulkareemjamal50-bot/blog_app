import 'package:firebase/features/auth/Dashboard/Screen/dashboard.dart';
import 'package:firebase/features/auth/auth_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.authService,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthService authService;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;

  Future<void> _handleLogin() async {
    final String email = widget.emailController.text.trim();
    final String password = widget.passwordController.text;

    // Check if fields are empty
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password'),
        ),
      );
      return;
    }

    // Start loading
    setState(() {
      isLoading = true;
    });

    try {
      // Sign in with Firebase
      await widget.authService.signIn(email, password);

      if (!mounted) return;

      // Stop loading
      setState(() {
        isLoading = false;
      });

      // Go to Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    } catch (err) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $err'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _login(
      widget.emailController,
      widget.passwordController,
      _handleLogin,
      isLoading,
    );
  }
}

Widget _login(
  TextEditingController emailController,
  TextEditingController passwordController,
  VoidCallback onLogin,
  bool isLoading,
) {
  return Column(
    children: [
      TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(color: Colors.white),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),

      const SizedBox(height: 15),

      TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(color: Colors.white),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),

      const SizedBox(height: 20),

      ElevatedButton(
        onPressed: isLoading ? null : onLogin,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : const Text('Login'),
      ),
    ],
  );
}