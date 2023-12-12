part of 'agents_cubit.dart';

@immutable
abstract class AgentsState {}

class AgentsInitialState extends AgentsState {
  AgentsInitialState();
}

class AgentsLoadingState extends AgentsState {
  AgentsLoadingState();
}

class AgentsSuccessState extends AgentsState {
  final List<CharacterModel> charList;

  AgentsSuccessState({required this.charList});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AgentsSuccessState && other.charList == charList;
  }

  @override
  int get hashCode => charList.hashCode;
}

class AgentsFailureState extends AgentsState {
  final String message;

  AgentsFailureState({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AgentsFailureState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
