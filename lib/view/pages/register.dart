import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ventas/controller/login.dart';

import '../../controller/request/register.dart';

class RegisterPage extends StatelessWidget {
  late RegisterRequest _request;
  late LoginController _controller;

  RegisterPage({super.key}) {
    _request = RegisterRequest();
    _controller = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(  
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                _fieldWidget(
                    title: "Nombre",
                    validate: validarCampoObligatorio,
                    save: (newValue) {
                      _request.name = newValue!;
                    }),
                _fieldWidget(
                  title: "Direccion",
                  validate: validarCampoObligatorio,
                  save: (newValue) {
                    _request.address = newValue!;
                  },
                ),
                _fieldWidget(
                  title: "Correo Electronico",
                  validate: validarCampoObligatorioCorreo,
                  save: (newValue) {
                    _request.email = newValue!;
                  },
                ),
                _fieldWidget(
                  title: "Telefono",
                  validate: (value) => null,
                  save: (newValue) {
                    _request.phone = newValue!;
                  },
                ),
                _fieldWidget(
                  title: "Contraseña",
                  validate: validarCampoObligatorioClave,
                  save: (newValue) {
                    _request.password = newValue!;
                  },
                  isPassword: true,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      try {
                        await _controller.registerNewUser(_request);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Usuario registrado correctamente")));
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }

                      print(_request.name);
                      print(_request.email);
                      print(_request.address);
                      print(_request.password);
                      print(_request.phone);
                    }
                  },
                  child: const Text("Registrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validarCampoObligatorioClave(String? value) {
    if (value == null || value.isEmpty) {
      return "La contraseña es es obligatoria";
    }
    if (value.length < 6) {
      return "Minimo debe contener 6 caracteres";
    }
    return null;
  }

  String? validarCampoObligatorio(String? value) {
    if (value == null || value.isEmpty) {
      return "El correo electronico es obligatorio";
    }
    return null;
  }

  String? validarCampoObligatorioCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return "El correo electronico es obligatorio";
    }
    if (!value.contains("@") || !value.contains(".")) {
      return "El correo tiene un formato invalido";
    }
    return null;
  }

  Widget _fieldWidget(
      {required String title,
      required FormFieldValidator<String> validate,
      required FormFieldSetter<String> save,
      bool isPassword = false}) {
    return Column(
      children: [
        TextFormField(
          maxLength: 50,
          keyboardType: TextInputType.multiline,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: title,
          ),
          validator: validate,
          onSaved: save,
        ),
      ],
    );
  }
}
