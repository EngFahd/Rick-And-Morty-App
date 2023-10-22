part of 'charcter_cubit.dart';

@immutable
sealed class CharcterState {}

final class CharcterInitial extends CharcterState {}

final class CharcterSuccess extends CharcterState {
  final List<CharacterModel> SuccessList;
  CharcterSuccess({required this.SuccessList});
}

final class CharcterLoading extends CharcterState {}

final class CharcterFailer extends CharcterState {
  final String erroMessage;
  CharcterFailer(this.erroMessage);
}
