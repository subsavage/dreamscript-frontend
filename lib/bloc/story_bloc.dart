// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'story_event.dart';
// import 'story_state.dart';

// class StoryBloc extends Bloc<StoryEvent, StoryState> {
//   StoryBloc() : super(StoryInitial()) {
//     on<SelectWorld>(_onSelectWorld);
//     on<StartStory>(_onStartStory);
//     on<ContinueStory>(_onContinueStory);
//     on<UserWrites>(_onUserWrites);
//     on<RedoStory>(_onRedoStory);
//   }

//   Future<void> _onSelectWorld(
//       SelectWorld event, Emitter<StoryState> emit) async {
//     emit(StoryLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-api-url/story/select-world'),
//         body: {'user_id': 'test_user', 'world': event.world},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(StoryLoaded(data['story_start']));
//       } else {
//         emit(StoryError("Failed to select world"));
//       }
//     } catch (e) {
//       emit(StoryError(e.toString()));
//     }
//   }

//   Future<void> _onStartStory(StartStory event, Emitter<StoryState> emit) async {
//     emit(StoryLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-api-url/story/start-story'),
//         body: {'user_id': event.userId},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(StoryLoaded(data['story']));
//       } else {
//         emit(StoryError("Failed to start story"));
//       }
//     } catch (e) {
//       emit(StoryError(e.toString()));
//     }
//   }

//   Future<void> _onContinueStory(
//       ContinueStory event, Emitter<StoryState> emit) async {
//     emit(StoryLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-api-url/story/continue-story'),
//         body: {'user_id': event.userId},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(StoryLoaded(data['story']));
//       } else {
//         emit(StoryError("Failed to continue story"));
//       }
//     } catch (e) {
//       emit(StoryError(e.toString()));
//     }
//   }

//   Future<void> _onUserWrites(UserWrites event, Emitter<StoryState> emit) async {
//     emit(StoryLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-api-url/story/user-writes'),
//         body: {'user_id': event.userId, 'user_input': event.userInput},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(StoryLoaded(data['story']));
//       } else {
//         emit(StoryError("Failed to send user input"));
//       }
//     } catch (e) {
//       emit(StoryError(e.toString()));
//     }
//   }

//   Future<void> _onRedoStory(RedoStory event, Emitter<StoryState> emit) async {
//     emit(StoryLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-api-url/story/redo'),
//         body: {'user_id': event.userId},
//       );
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         emit(StoryLoaded(data['story']));
//       } else {
//         emit(StoryError("Failed to redo story"));
//       }
//     } catch (e) {
//       emit(StoryError(e.toString()));
//     }
//   }
// }
