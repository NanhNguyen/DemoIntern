// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [IntroScreen]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
      : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IntroScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    required String contact,
    required bool isPhone,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(key: key, contact: contact, isPhone: isPhone),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return OtpScreen(
        key: args.key,
        contact: args.contact,
        isPhone: args.isPhone,
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.contact, required this.isPhone});

  final Key? key;

  final String contact;

  final bool isPhone;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, contact: $contact, isPhone: $isPhone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key &&
        contact == other.contact &&
        isPhone == other.isPhone;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode ^ isPhone.hashCode;
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(VerificationRoute.name, initialChildren: children);

  static const String name = 'VerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VerificationScreen();
    },
  );
}
