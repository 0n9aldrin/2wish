import 'package:firebase_auth/firebase_auth.dart';
import 'package:two_wish/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User user) {
    return user != null
        ? CustomUser(uid: user.uid, phoneNumber: user.phoneNumber)
        : null;
  }

  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  CustomUser getCurrentUser() {
    try {
      return _userFromFirebaseUser(_auth.currentUser);
    } catch (e) {
      return null;
    }
  }
}
