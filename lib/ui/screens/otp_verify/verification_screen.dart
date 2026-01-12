import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internship_demo/data/api/api_client.dart';
import 'package:internship_demo/data/api/auth_api.dart';
import 'package:internship_demo/data/repository/auth_repository.dart';
import 'package:internship_demo/foundation/storage/token_storage.dart';

import 'package:internship_demo/ui/screens/login/cubit/login_cubit.dart';
import 'package:internship_demo/ui/screens/login/cubit/login_state.dart';
import 'package:internship_demo/ui/navigation/routes/app_router.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository(AuthApi(ApiClient()), TokenStorage());

    return BlocProvider(
      create: (_) => LoginCubit(authRepository),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.isSuccess) {
                context.router.replace(const HomeRoute());
              }

              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Welcome back 👋'),
                const SizedBox(height: 32),

                /// Email
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                /// Password
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 32),

                /// Login button
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              context.read<LoginCubit>().login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: state.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : const Text('Login'),
                    );
                  },
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    const Text('No account?'),
                    TextButton(
                      onPressed: () {
                        context.router.push(const RegisterRoute());
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
