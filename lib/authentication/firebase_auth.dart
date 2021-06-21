
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthentication {

  FirebaseAuth _firebaseauth = FirebaseAuth.instance ;

  Future getCurrentUser() async{
    var user = _firebaseauth.currentUser;
    print(user);
    return user;
  }
  Future signOut() async{
    await _firebaseauth.signOut();
  }

  Future sigIn(String email ,String password) async {
    UserCredential user = await  _firebaseauth.signInWithEmailAndPassword(email: email, password: password);
    return user ;
  }
  Future<AuthCredential> register( String email , String password ) async{
    UserCredential authuser = await _firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
    return authuser.credential ;
  }
}