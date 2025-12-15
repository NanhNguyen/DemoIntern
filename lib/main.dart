import 'package:flutter/material.dart';
import 'package:internship_demo/ui/screens/intro/presentation/screens/intro_screen.dart';
import 'package:internship_demo/ui/navigation/routes/app_router.dart';

final _appRouter = AppRouter();
void main() {
  runApp(MyApp(appRouter: _appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
