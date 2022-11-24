import 'package:ventas/controller/request/register.dart';
import 'package:ventas/model/entity/user.dart';

import '../controller/request/login.dart';

import '../model/repository/fb_auth.dart';
import '../model/repository/user.dart';

class LoginController {
  late final UserRepository _userRepository;
  late final FirebaseAutheticationRepository _authRepository;

  LoginController() {
    _userRepository = UserRepository();
    _authRepository = FirebaseAutheticationRepository();
  }

  Future<String> validateEmailPassword(LoginRequest request) async {
    await _authRepository.signInEmailPassword(request.email, request.password);

    // Consultar el usuario que tenga el correo dado
    var user = _userRepository.findByEmail(request.email);

    return user.name!;
  }

  Future<void> registerNewUser(RegisterRequest request,
      {bool adminUser = false}) async {
    // Crear correo/clave en Firebase Auth
    await _authRepository
        .createEmailPasswordAccount(request.email, request.password)
        .then((value) {
      // Agregar información adicional en BBDD
      _userRepository.save(UserEntity(
          email: request.email,
          name: request.name,
          address: request.address,
          phone: request.phone,
          isAdmin: adminUser));
    });
  }
}
