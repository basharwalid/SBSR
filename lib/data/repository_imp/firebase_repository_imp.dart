import 'package:sbsr/data/datasource/firebase_data_source.dart';
import 'package:sbsr/domain/Entities/userEntity.dart';
import 'package:sbsr/domain/repository/FirebaseRepo.dart';

class FirebaseRepositoryImp implements FirebaseRepository{

  final FirebaseDataSource firebaseDataSource;
  FirebaseRepositoryImp({required this.firebaseDataSource});

  @override
  Future<void> ForgetPassword(String email)  async{
    firebaseDataSource.ForgetPassword(email);
  }

  @override
  Future<void> SignUp(userEntity user) async {
   firebaseDataSource.SignUp(user);
  }

  @override
  Future<void> login(userEntity user) async {
   firebaseDataSource.login(user);
  }

  @override
  Future<void> createUser(userEntity user) async{
   firebaseDataSource.createUser(user);
  }



}