import 'package:sbsr/domain/Entities/userEntity.dart';
import 'package:sbsr/domain/repository/FirebaseRepo.dart';

class createUserUsecase{
  final FirebaseRepository repository;

  createUserUsecase({required this.repository});

  Future<void> createuser(userEntity user){
    return repository.createUser(user);
  }
}