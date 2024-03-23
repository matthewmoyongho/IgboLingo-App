import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {}

class LoadVideos extends VideosEvent {
  LoadVideos();

  @override
  List<Object?> get props => [];
}

class GetVideos extends VideosEvent {
  final String uid;
  final String id;
  GetVideos({required this.id, required this.uid});
  @override
  List<Object?> get props => [id];
}

// class DeleteAssignment extends AssignmentEvent {
//   final Assignment assignment;
//   DeleteAssignment(this.assignment);
//   @override
//   List<Object?> get props => [assignment];
// }
//
// class UpdateAssignment extends AssignmentEvent {
//   final Assignment assignment;
//   UpdateAssignment(this.assignment);
//   @override
//   List<Object?> get props => [assignment];
// }

// class ToggleDone extends AssignmentEvent {
//   final bool done;
//   final Assignment assignment;
//   ToggleDone({required this.done, required this.assignment});
//   @override
//   List<Object?> get props => [done, assignment];
// }
