import 'package:auto_route/auto_route.dart';
import 'package:internship_demo/ui/screens/login/login_screen.dart';
import 'package:internship_demo/ui/screens/otp_verify/otp_screen.dart';
import 'package:internship_demo/ui/screens/register/register_screen.dart';
import '../../screens/otp_verify/verification_screen.dart';
import '../../screens/intro/intro_screen.dart';
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
