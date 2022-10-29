import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/images/imagenventas.jpg"),
              const SizedBox(
                height: 50,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electronico',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Iniciar Sesión"),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("O iniciar sesión con"),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Facebook"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Google"),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("No tiene usuario, Registrate aquí"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
