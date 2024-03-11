import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jedzenie_jedynaka/app/domain/models/user_model.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/user_repository.dart';

part 'app_root_state.dart';
part 'app_root_cubit.freezed.dart';

class AppRootCubit extends Cubit<AppRootState> {
  AppRootCubit(this._userRepository)
      : super(const AppRootState(
          user: null,
          errorMessage: '',
          isLoading: true,
        ));

  final UserRepository _userRepository;
  StreamSubscription? streamSubscription;

  Future<void> start() async {
    try {
      streamSubscription = _userRepository.actionEvent().listen((event) {
        emit(
          AppRootState(
            user: event,
            isLoading: false,
            errorMessage: '',
          ),
        );
      });
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
    _userRepository.signOut();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _userRepository.signIn(email: email, password: password);
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

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      _userRepository.createAccount(email: email, password: password);
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

  Future<void> remindPassword({
    required String email,
  }) async {
    try {
      _userRepository.remindPassword(email: email);
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
}
