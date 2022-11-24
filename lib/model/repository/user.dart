import '../entity/user.dart';

class UserRepository {
  final _users = <String, UserEntity>{};

  UserRepository() {
    _users["crisquesadaco@gmail.com"] = UserEntity(
      email: "crisquesadaco@gmail.com",
      name: "Cristian Quesada Cossio",
      address: "Tinajas",
      isAdmin: true,
      phone: "3207101556",
    );
    _users["laura@gmail.com"] = UserEntity(
      email: "laura@gmail.com",
      name: "Laura Cristina Pachecho",
      address: "Birmania",
      isAdmin: false,
      phone: "3104135841",
    );
  }

  UserEntity findByEmail(String email) {
    var user = _users[email];

    if (user == null) {
      throw Exception("Usuario no existe");
    }
    return user;
  }

  void save(UserEntity user) {
    print(user);
  }
}
