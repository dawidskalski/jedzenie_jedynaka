import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'app_root_state.dart';

class AppRootCubit extends Cubit<AppRootState> {
  AppRootCubit()
      : super(const AppRootState(
          user: null,
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AppRootState(
        user: null,
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (currentUser) {
        emit(
          AppRootState(
            user: currentUser,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            AppRootState(
              user: null,
              isLoading: false,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      emit(
        AppRootState(
          user: null,
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createAccount(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      emit(
        AppRootState(
          user: null,
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remindPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {
      emit(
        AppRootState(
          user: null,
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
