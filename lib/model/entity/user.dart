import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  late String? email;
  late String? name;
  late String? address;
  late String? phone;
  late String? password;
  late bool? isAdmin;

  UserEntity({this.email, this.name, this.address, this.phone, this.isAdmin});

  // Método que es capaz de crear objetos
  factory UserEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();

    return UserEntity(
        email: data?["email"],
        name: data?["name"],
        address: data?["address"],
        phone: data?["phone"],
        isAdmin: data?["isAdmin"]);
  }

  Map<String, dynamic> toFirestore() {
    // Tomará los datos que tiene y los convierte a mapa
    return {
      if (email != null && email!.isNotEmpty) "email": email,
      if (name != null && name!.isNotEmpty) "name": name,
      if (address != null && address!.isNotEmpty) "address": address,
      if (phone != null && phone!.isNotEmpty) "phone": phone,
      "isAdmin": isAdmin ??
          false // En caso de que traiga un valor, lo ultiliza, de lo contrario pone false.
    };
  }

  @override
  String toString() {
    return "UserEntity {$email, $name, $address, $phone, $isAdmin}";
  }
}
