part of 'app_root_cubit.dart';

@immutable
class AppRootState {
  final User? user;
  final bool isLoading;
  final String errorMessage;

  const AppRootState({
    required this.user,
    required this.isLoading,
    required this.errorMessage,
  });
}
