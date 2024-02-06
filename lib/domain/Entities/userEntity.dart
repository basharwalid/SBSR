class userEntity  {
  String? uid;
  String? email;
  String? name;
  String? phone;
  String? password;

  userEntity({
    this.uid,
    this.email,
    this.name,
    this.phone,
    this.password,
  });

List<Object?> get props => [
  uid,
  email,
  name,
  phone,
  password,];
}
