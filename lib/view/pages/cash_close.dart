import 'package:flutter/material.dart';
import 'package:ventas/view/widgets/drawer.dart';

class CashClosePage extends StatelessWidget {
  const CashClosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cierre de caja"),
      ),
      drawer: const DrawerWidget(email: "", name: ""),
    );
  }
}
