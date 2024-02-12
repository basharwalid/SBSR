import 'package:sbsr/domain/Entities/userEntity.dart';
import 'package:sbsr/domain/repository/FirebaseRepo.dart';

class LoginUsecase{
  final FirebaseRepository repository;
  
 LoginUsecase({required this.repository});

 Future<void> Login(userEntity user){
   return repository.login(user);
 }
}