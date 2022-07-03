import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_findeat/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      throw e;
    }
  }

  //NOTE OLD VERSION
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
          id: id, email: snapshot['email'], name: snapshot['name']);
    } catch (e) {
      throw e;
    }
  }
}
