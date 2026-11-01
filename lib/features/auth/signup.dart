import 'package:firebase/features/auth/auth_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required this.signUPEmailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.fullNameController,
    required this.authService,
  });

  final TextEditingController signUPEmailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController fullNameController;
  final AuthService authService;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<void> handleSignUp() async {
    // Check if passwords match
    if (widget.passwordController.text !=
        widget.confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return;
    }

    try {
      await widget.authService.signUp(
        widget.signUPEmailController.text.trim(),
        widget.passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully'),
        ),
      );
    } catch (err) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign up failed: $err'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _signup(
      widget.signUPEmailController,
      widget.passwordController,
      widget.confirmPasswordController,
      widget.fullNameController,
      handleSignUp,
    );
  }
}

Widget _signup(
  TextEditingController signUPEmailController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
  TextEditingController fullNameController,
  VoidCallback onSignUp,
) {
  return Column(
    children: [
      TextFormField(
        controller: fullNameController,
        decoration: InputDecoration(
          labelText: 'Full Name',
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
        controller: signUPEmailController,
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

      const SizedBox(height: 15),

      TextFormField(
        controller: confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
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
        onPressed: onSignUp,
        child: const Text('Sign Up'),
      ),
    ],
  );
}