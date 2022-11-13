import '../controller/request/login.dart';

import '../model/repository/user.dart';

class LoginController {
  late final UserRepository _userRepository;

  LoginController() {
    _userRepository = UserRepository();
  }

  String validateEmailPassword(LoginRequest request) {
    // Consultar el usuario que tenga el correo dado
    var user = _userRepository.findByEmail(request.email);

    // Verificar si la clave es igual a al que está en la BD
    if (user.password != request.password) {
      throw Exception("Credenciales inválidas");
    }

    return user.name!;
  }
}
