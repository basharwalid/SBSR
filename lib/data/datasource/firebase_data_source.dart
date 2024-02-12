import 'package:sbsr/domain/Entities/userEntity.dart';

abstract class FirebaseDataSource{
  Future<void> login(userEntity user);
  Future<void> SignUp(userEntity user);
  Future<void> ForgetPassword(String email);
  Future<void> createUser(userEntity user);

}