import 'package:auto_route/auto_route.dart';
import 'package:internship_demo/features/auth/presentation/screens/login_screen.dart';
import 'package:internship_demo/features/auth/presentation/screens/otp_screen.dart';
import 'package:internship_demo/features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/verification_screen.dart';
import '../../features/intro/presentation/screens/intro_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: IntroRoute.page, path: '/intro', initial: true),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: VerificationRoute.page, path: '/verify'),
    AutoRoute(page: OtpRoute.page, path: '/otp'),
  ];
}
