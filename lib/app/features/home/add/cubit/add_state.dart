part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  const factory AddState({
    required String errorMessage,
  }) = _Initial;
}
