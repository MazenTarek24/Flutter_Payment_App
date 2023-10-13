import 'package:flutter/material.dart';
import 'package:payment/core/api_service.dart';

import 'features/register_screen/presentation/view/register_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}


