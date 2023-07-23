import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/extensions/string_exten.dart';

import '../../../network/services/content_service.dart';
import '../../../network/services/project_service.dart';

part 'text_gen_event.dart';
part 'text_gen_state.dart';

class TextGenBloc extends Bloc<TextGenEvent, TextGenState> {
  TextGenBloc() : super(TextGenInitial()) {
    on<GenerateContent>(_onGenerateContent);
    on<SaveProject>(_onSaveProject);
    on<SaveContent>(_onSaveContent);
  }

  var contentService = ContentService();
  var projectService = ProjectService();

  void _onSaveContent(SaveContent event, Emitter emit)async{
    emit(SavingContent());
    try{
      await contentService.createContent(
        projectId: event.projectId, 
        originalText: event.originalText, 
        text: event.text, 
        toolKey: event.toolKey
      );
      emit(ContentSaved());
    }catch(e){
      emit(Failure());
    }
  }

  void _onSaveProject(SaveProject event, Emitter emit)async{
    emit(SavingProject());
    try{
      var project = await projectService.createProject(
        projectName: event.projectName,
        name: event.name,
        tone: event.tone,
        toolKey: event.toolKey,
        description: event.description,
        fromTemplate: event.fromTemplate,
        templateId: event.templateId,
      );
      emit(ProjectSaved(
        projectId: project['_id']
      ));
    }catch(e){
      emit(Failure());
    }
  }

  void _onGenerateContent(GenerateContent event, Emitter emit)async{
    emit(Loading());
    try{
      var tool = event.tool.addSpacesBeforeCapitalLetters();
      final prompt = 'Generate $tool based on following information:\nTitle: ${event.title}\nDescription: ${event.description}\nTone: ${event.tone}';
      OpenAICompletionModel completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        prompt: prompt,
        maxTokens: 50,
        temperature: 1,
        n: 5,
      );
      var choices = completion.choices.map((e) => e.text.trim()).toList();
      emit(ContentGenerated(contents: choices));
    }catch(e){
      emit(Failure());
    }
  }
}
