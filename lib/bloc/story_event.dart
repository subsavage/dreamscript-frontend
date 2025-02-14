import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectWorld extends StoryEvent {
  final String world;
  SelectWorld(this.world);

  @override
  List<Object> get props => [world];
}

class StartStory extends StoryEvent {
  final String userId;
  StartStory(this.userId);

  @override
  List<Object> get props => [userId];
}

class ContinueStory extends StoryEvent {
  final String userId;
  ContinueStory(this.userId);

  @override
  List<Object> get props => [userId];
}

class UserWrites extends StoryEvent {
  final String userId;
  final String userInput;
  UserWrites(this.userId, this.userInput);

  @override
  List<Object> get props => [userId, userInput];
}

class RedoStory extends StoryEvent {
  final String userId;
  RedoStory(this.userId);

  @override
  List<Object> get props => [userId];
}
