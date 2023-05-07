import 'package:fleet_admin_panel/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ready/ready.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';
import 'firebase_options.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppThemes.transparent
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fleet Admin Panel',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        Ready.delegate,
      ],
      themeMode: _mode,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: const Locale('en'),
      home: DashBoardExample(
        onModeChanged: (value) {
          setState(() {
            _mode = value;
          });
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}