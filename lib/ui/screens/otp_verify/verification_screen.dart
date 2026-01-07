import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internship_demo/ui/screens/login/login/login_bloc.dart';
import 'package:internship_demo/ui/screens/login/login/login_event.dart';
import 'package:internship_demo/ui/screens/login/login/login_state.dart';

import 'package:internship_demo/data/auth_api.dart';

import 'package:internship_demo/ui/screens/auth/repo/auth_repository.dart';
import 'package:internship_demo/ui/navigation/routes/app_router.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject repository rõ ràng
    final authRepository = AuthRepository(api: AuthApi());

    return BlocProvider(
      create: (_) => LoginBloc(authRepository: AuthRepository(api: AuthApi())),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocListener<LoginBloc, LoginState>(
              listenWhen: (prev, curr) =>
                  prev.otpSent != curr.otpSent || prev.error != curr.error,
              listener: (context, state) {
                if (state.otpSent) {
                  context.router.push(
                    OtpRoute(
                      contact: state.input,
                      isPhone: state.method == LoginMethod.phone,
                    ),
                  );
                }

                if (state.error != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error!)));
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        const Text(
                          '2FA Verification',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text('Hello, Welcome back to your account.'),
                    const SizedBox(height: 20),

                    // Toggle Email / Phone
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => context.read<LoginBloc>().add(
                                        ToggleMethod(toEmail: true),
                                      ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: state.method == LoginMethod.email
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(child: Text('Email')),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => context.read<LoginBloc>().add(
                                        ToggleMethod(toEmail: false),
                                      ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: state.method == LoginMethod.phone
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(child: Text('Phone')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Input field
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        final isPhone = state.method == LoginMethod.phone;
                        return TextField(
                          keyboardType: isPhone
                              ? TextInputType.phone
                              : TextInputType.emailAddress,
                          onChanged: (v) =>
                              context.read<LoginBloc>().add(InputChanged(v)),
                          decoration: InputDecoration(
                            hintText: isPhone
                                ? 'Input your phone number'
                                : 'Input your email',
                            prefixIcon: isPhone
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/images/flag.png',
                                      width: 28,
                                    ),
                                  )
                                : null,
                            suffixIcon: state.input.isNotEmpty
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    // Request OTP button
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () => context.read<LoginBloc>().add(
                                    RequestOtpPressed(),
                                  ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          child: state.isSubmitting
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                )
                              : const Text('Request OTP'),
                        );
                      },
                    ),

                    const SizedBox(height: 40),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('Sign in with Google'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 12),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Google')),
                    ),

                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          'No account yet? ',
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Create an account',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
