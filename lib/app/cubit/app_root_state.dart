part of 'app_root_cubit.dart';

@freezed
class AppRootState with _$AppRootState {
  const AppRootState._();
  const factory AppRootState({
    required UserModel? user,
    required bool isLoading,
    required String errorMessage,
  }) = _AppRootState;
}
