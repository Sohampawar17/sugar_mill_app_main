import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sugar_mill_app/router.locator.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/views/splash_screen_view/splash_screen.dart';
import 'themes/color_schemes.g.dart';
import 'themes/custom_color.g.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme, // Use fixed light color scheme
        extensions: [lightCustomColors],
      ),
      home: const SplashScreen(),
    );
  }
}
