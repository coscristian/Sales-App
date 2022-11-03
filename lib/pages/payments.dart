import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ventas"),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Cobros"),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(),
                    title: const Text("Cristian Quesada"),
                    subtitle: const Text("Dirección"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const CircleAvatar(),
                    title: const Text("Juan José Quesada"),
                    subtitle: const Text("Dirección"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const CircleAvatar(),
                    title: const Text("Alberto Diaz"),
                    subtitle: const Text("Dirección"),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_shopping_cart), onPressed: () {}),
    );
  }
}
