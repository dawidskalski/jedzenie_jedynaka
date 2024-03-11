import 'package:firebase_auth/firebase_auth.dart';
import 'package:jedzenie_jedynaka/app/domain/models/user_model.dart';

class UserRepository {
  Stream<UserModel> actionEvent() {
    return FirebaseAuth.instance
        .authStateChanges()
        .map((event) => UserModel(user: event!));
  }

  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createAccount(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> remindPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
