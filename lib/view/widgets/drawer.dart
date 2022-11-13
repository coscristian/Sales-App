import 'package:flutter/material.dart';
import '../pages/cash_close.dart';
import '../pages/payments.dart';

class DrawerWidget extends StatelessWidget {
  final String email;
  final String name;

  const DrawerWidget({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: _header(),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Cobros'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentsPage(email: email, name: name),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Ventas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.supervisor_account),
            title: const Text('Clientes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Cierre de caja'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CashClosePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _header() {
    //TODO: Consultar los datos de la cabecera

    const image = Icon(Icons.manage_accounts);

    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          child: image,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                email,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
