import 'package:flutter/material.dart';
import 'package:ventas/view/pages/register.dart';
import '../../controller/login.dart';
import '../../controller/request/login.dart';
import 'payments.dart';

class LoginPage extends StatelessWidget {
  final _imageUrl = "assets/images/imagenventas.jpg";
  late LoginController _controller;
  late LoginRequest _request; // Define una variable

  LoginPage({super.key}) {
    _controller = LoginController();
    _request = LoginRequest();
  }

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                // Guarde todos los campos del formulario
                formKey.currentState!.save();
                try {
                  // Validar correo y clave en BBDD
                  var name = await _controller.validateEmailPassword(_request);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentsPage(email: _request.email, name: name),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
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
      onSaved: (value) {
        // Guarde la clave en el modelo del login request
        _request.password = value!;
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
      onSaved: (value) {
        // Guarde el correo en el modelo del login request
        _request.email = value!;
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
