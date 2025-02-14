import 'package:equatable/equatable.dart';

abstract class StoryState extends Equatable {
  @override
  List<Object> get props => [];

  get showChatField => null;
}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final String story;
  StoryLoaded(this.story);

  @override
  List<Object> get props => [story];
}

class StoryError extends StoryState {
  final String message;
  StoryError(this.message);

  @override
  List<Object> get props => [message];
}
