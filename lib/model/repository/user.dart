import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/user.dart';

class UserRepository {
  late final CollectionReference _collection;

  UserRepository() {
    _collection = FirebaseFirestore.instance.collection("users");
  }

  Future<UserEntity> findByEmail(String email) async {
    final query = await _collection
        .where("email", isEqualTo: email) // COndición para la consulta
        .withConverter(  // Devuelve el objeto no el mapa
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())        
        .get(); // Haga la busqueda

    var users = await query.docs  // Tome los documentos
        .cast() // Conviertalos a una lista
        .map((e) => e.data()); // A cada uno de los objetos, obtenga la información

    if (users.isEmpty) {
      return Future.error("Usuario no existe");
    }

    return users.first;
  }

  Future<void> save(UserEntity user) async {
    await _collection
        .withConverter(
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(user); // Mapa con toda la informacion que quiero guardar
  }
}
