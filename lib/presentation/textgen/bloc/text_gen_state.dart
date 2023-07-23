part of 'text_gen_bloc.dart';

abstract class TextGenState extends Equatable {
  const TextGenState();
  
  @override
  List<Object> get props => [];
}

class TextGenInitial extends TextGenState {}

class Loading extends TextGenState {}

class SavingContent extends TextGenState {}

class SavingProject extends TextGenState {}

class ProjectSaved extends TextGenState {
  final String projectId;
  const ProjectSaved({
    required this.projectId
  });
}

class ContentSaved extends TextGenState {}

class ContentGenerated extends TextGenState {
  final List<String> contents;

  const ContentGenerated({
    required this.contents
  });
}

class Failure extends TextGenState {}