import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internship_demo/ui/navigation/routes/app_router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 32),

            /// Login button → Backend auth → Nếu đúng thì chuyển qua verification
            ElevatedButton(
              onPressed: () {
                context.router.push(VerificationRoute());
              },
              child: const Text("Login"),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () => context.router.push(const RegisterRoute()),
              child: const Text("Create an account"),
            ),
          ],
        ),
      ),
    );
  }
}
