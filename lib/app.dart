import 'package:flutter/material.dart';
import 'package:ventas/view/pages/login.dart';

import 'view/pages/payments.dart';
import 'view/pages/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ventas a domicilio",
      home: LoginPage(),
    );
  }
}
