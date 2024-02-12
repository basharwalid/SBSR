import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/model/userModel.dart';

class UsersDao {
  static CollectionReference<UserModel> userCollection() {
    var db = FirebaseFirestore.instance;
    var userCollection = db.collection("Users").withConverter(
        fromFirestore: (snapshot, options) =>
            UserModel.fromFirestore(snapshot.data()!),
        toFirestore: (object, options) => object.toFirestore());

    return userCollection;
  }

  static Future<void> createUser(UserModel user) async{
    var usercollection = userCollection();
    var docRef = usercollection.doc(user.id);
    docRef.set(user);
  }

  static Future<UserModel?> getUser(String uid) async{
    var doc =userCollection().doc(uid);
    var docSnapshot= await doc.get();
    return docSnapshot.data();
  }
}