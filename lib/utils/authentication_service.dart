import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vidaleve/utils/firebase_exceptions.dart';
import 'package:firebase_ui_database/firebase_ui_database.dart';

class AuthenticationService {
  static final _auth = FirebaseAuth.instance;
  static late AuthStatus _status;
  final usersQuery = FirebaseDatabase.instance.ref('users').orderByChild('name');


  Future<AuthStatus> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _auth.currentUser!.updateDisplayName(name);
      //_auth.currentUser!.updateProfile(displayName: username);

      newUser.user!.sendEmailVerification();

      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    }
    return _status;
  }

  Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    }

    return _status;
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
  
  Future<void> currentUser() async {
    print('oii');
    
    final usersQuery = FirebaseDatabase.instance.ref('users').orderByChild('name');
    
    print(usersQuery);
  }
}
