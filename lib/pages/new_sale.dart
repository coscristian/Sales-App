import 'package:flutter/material.dart';

class NewSalePage extends StatelessWidget {
  const NewSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ventas"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _formulario(context),
        ),
      ),
    );
  }

  Widget _formulario(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Nueva Venta",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _campoCliente(),
              const SizedBox(
                height: 8,
              ),
              _campoDireccion(),
              const SizedBox(
                height: 8,
              ),
              _campoMonto(),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _numeroCuotas(),
                  const SizedBox(
                    width: 16,
                  ),
                  _periodicidad(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Periodicidad',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _valorCuota(),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // TODO: Guardar los datos en la BD
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Venta realizada con exito"),
                        ),
                      );
                      // Volver a la pantalla anterior
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Guardar")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _campoCliente() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        icon: Icon(Icons.manage_accounts),
        border: OutlineInputBorder(),
        labelText: 'Cliente',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El campo es obligatorio";
        }
        return null;
      },
    );
  }

  Widget _campoDireccion() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Dirección',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El campo es obligatorio";
        }
        return null;
      },
    );
  }

  Widget _campoMonto() {
    return TextFormField(
      initialValue: "0",
      textAlign: TextAlign.right,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Monto',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El campo es obligatorio";
        }
        if (int.parse(value) < 1) {
          return "El campo no es valido";
        }
        return null;
      },
    );
  }

  Widget _numeroCuotas() {
    return Expanded(
      child: TextFormField(
        initialValue: "1",
        textAlign: TextAlign.right,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Numero Cuotas',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "El campo es obligatorio";
          }
          if (int.parse(value) < 1) {
            return "El campo no es valido";
          }
          return null;
        },
      ),
    );
  }

  Widget _periodicidad() {
    var opciones = <String>["Diario", "Semanal", "Quincenal", "Mensual"];
    var valor = opciones[0];

    return Expanded(
      child: DropdownButtonFormField(
        value: valor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Periodicidad',
        ),
        items: opciones
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _valorCuota() {
    return TextFormField(
      enabled: false,
      textAlign: TextAlign.right,
      initialValue: "0",
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Valor Cuota',
      ),
    );
  }
}
