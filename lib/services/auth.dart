import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class User {
  User({@required this.uid});
  final String uid; //user id
}

abstract class AuthBase{ //W146
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

//W144
class Auth implements AuthBase{
final _firebaseAuth = FirebaseAuth.instance;

User _userFromFirebase(FirebaseUser user){ //metoda ta konwertuje Firebase object na obiekt user zawierajacy tylko uid
  if(user == null){
    return null;
  }
  return User(uid: user.uid);
}
  @override
  Future<User> currentUser() async{
    final user =  await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async{
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}