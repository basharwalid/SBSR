import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr/data/datasource/firebase_data_source.dart';
import 'package:sbsr/data/model/userModel.dart';
import 'package:sbsr/domain/Entities/userEntity.dart';

// class FirebaseDataSourceImp implements FirebaseDataSource {
//   final FirebaseAuth auth;
//   final FirebaseFirestore firestore;
//
//   FirebaseDataSourceImp({required this.auth, required this.firestore});
//
//   @override
//   Future<void> ForgetPassword(String email) async {
//     await auth.sendPasswordResetEmail(email: email);
//   }
//
//   @override
//   Future<void> SignUp(userEntity user) async {
//     await auth.createUserWithEmailAndPassword(
//         email: user.email!, password: user.password!);
//   }
//
//   @override
//   Future<void> login(userEntity user) async {
//     await auth.signInWithEmailAndPassword(
//         email: user.email!, password: user.password!);
//   }
//
//   @override
//   // Future<void> createUser(userEntity user) async {
//   //   final userCollection = firestore.collection("users");
//   //   userCollection.doc(user.uid).get().then((userDoc) {
//   //     final newuser = UserModel(
//   //             id: user.uid,
//   //             name: user.name,
//   //             email: user.email,
//   //             phone: user.phone,
//   //             password: user.password)
//   //         .toFirestore();
//   //
//   //     if (!userDoc.exists) {
//   //       userCollection.doc(user.uid).set(newuser);
//   //     }
//   //   });
//   }
// }
