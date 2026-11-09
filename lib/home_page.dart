import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'login_page.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});
 
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
 
    if (!context.mounted) return;
 
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }
 
  @override
  Widget build(BuildContext context) {
     final user = FirebaseAuth.instance.currentUser;
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${user?.email ?? "User"}!',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}