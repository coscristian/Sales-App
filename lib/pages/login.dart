import 'package:flutter/material.dart';
import 'package:ventas/pages/payments.dart';

class LoginPage extends StatelessWidget {
  final _imageUrl = "assets/images/imagenventas.jpg";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _logo(),
              _formulario(context),
              _inicioAlternativo(),
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

  Widget _logo() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(_imageUrl),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  // Context lleva el estado de la aplicacion en general (Manejo de pantallas, estados)
  Widget _formulario(BuildContext context) {
    // Llave global que maneja el estado de un formulario (Objeto que ayuda a controlar todo lo que va a suceder con el formulario)
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          _campoCorreoElectronico(),
          const SizedBox(
            height: 16,
          ),
          _campoClave(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: const Text(
              "Iniciar Sesión",
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // TODO: Validar usuario y contraseña en BBDD
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentsPage(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _campoClave() {
    return TextFormField(
      maxLength: 30,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Contraseña',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "La contraseña es es obligatoria";
        }
        if (value.length < 6) {
          return "Minimo debe contener 6 caracteres";
        }
        return null;
      },
    );
  }

  Widget _campoCorreoElectronico() {
    return TextFormField(
      maxLength: 50,
      keyboardType: TextInputType.multiline,
      obscureText: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Correo Electronico',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El correo electronico es obligatorio";
        }
        if (!value.contains("@") || !value.contains(".")) {
          return "El correo tiene un formato invalido";
        }
        return null;
      },
    );
  }

  Widget _inicioAlternativo() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
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
          height: 16,
        ),
      ],
    );
  }
}
