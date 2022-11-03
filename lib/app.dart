import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pages/new_sale.dart';
import 'pages/payments.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ventas a domicilio",
      home: NewSalePage(),
    );
  }
}
