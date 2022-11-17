class UserEntity {
  late String? email;
  late String? name;
  late String? address;
  late String? phone;
  late String? password;
  late bool? isAdmin;

  UserEntity(
      {this.email,
      this.name,
      this.address,
      this.phone,
      this.password,
      this.isAdmin});
}
