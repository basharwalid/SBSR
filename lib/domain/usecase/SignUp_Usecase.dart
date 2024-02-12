import 'package:sbsr/domain/Entities/userEntity.dart';
import 'package:sbsr/domain/repository/FirebaseRepo.dart';

class SignUpUsecase{
  final FirebaseRepository repository;

  SignUpUsecase({required this.repository});

  Future<void> SignUp(userEntity user){
    return repository.SignUp(user);
  }
}