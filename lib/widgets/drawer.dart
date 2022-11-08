import 'package:flutter/material.dart';
import 'package:ventas/pages/cash_close.dart';
import 'package:ventas/pages/payments.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

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
                  builder: (context) => const PaymentsPage(),
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
  } /*
Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            */

  Widget _header() {
    //TODO: Consultar los datos de la cabecera

    const image = Icon(Icons.manage_accounts);
    const name = "Cristian Quesada";
    const email = "crisquesadaco@gmail.com";

    return Row(
      children: [
        const CircleAvatar(
          child: image,
          radius: 30,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(email,
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ],
    );
  }
}
