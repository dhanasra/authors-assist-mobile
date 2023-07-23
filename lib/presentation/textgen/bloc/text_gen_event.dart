part of 'text_gen_bloc.dart';

abstract class TextGenEvent extends Equatable {
  const TextGenEvent();

  @override
  List<Object> get props => [];
}

class GenerateContent extends TextGenEvent {
  final String tool;
  final String title;
  final String description;
  final String tone;

  const GenerateContent({
    required this.description,
    required this.title,
    required this.tone,
    required this.tool
  });
}

class SaveContent extends TextGenEvent {
  final String projectId;
  final String originalText;
  final String text;
  final String toolKey;

  const SaveContent({
    required this.projectId,
    required this.originalText,
    required this.text,
    required this.toolKey
  });
}

class SaveProject extends TextGenEvent {
  final String projectName;
  final String name;
  final String tone;
  final String toolKey;
  final String description;
  final bool fromTemplate;
  final String templateId;

  const SaveProject({
    required this.projectName,
    required this.name,
    required this.tone,
    required this.toolKey,
    required this.description,
    required this.fromTemplate,
    required this.templateId
  });
}

