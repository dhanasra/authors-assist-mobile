import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/base/base_viewmodel.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/presentation/textgen/bloc/text_gen_bloc.dart';
import 'package:mobile/presentation/textgen/widgets/edit_content_sheet.dart';
import 'package:mobile/resources/toast.dart';
import 'package:mobile/widgets/text_input.dart';

class TextGenViewModel extends BaseViewModel {
  final BuildContext context;
  TextGenViewModel(this.context);

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController toneController;
  late TextEditingController projectNameController;
  String? projectId;
  String? saveString;
  List<String> contents = [];

  @override
  void initialize() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    toneController = TextEditingController();
    projectNameController = TextEditingController();
  }

  void editContent(String content){
    showModalBottomSheet(
      context: context, 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10)
        )
      ),
      builder: (_){
        return Padding(
          padding: const EdgeInsets.all(16),
          child: EditContentSheet(
            content: content,
            onCopyClick:(v)=>copyContent(v),
            onSaveClick:(v)=>saveContent(v)
          ),
        );
      });
  }

  void copyContent(String content){
    services.Clipboard.setData(services.ClipboardData(text: content));
    toast('Content copied successfully', success: true);
  }

  void saveContent(String content)async{
    if(projectId==null){
      saveString = content;
      saveProject();
    }else{
      context.read<TextGenBloc>().add(SaveContent(
        projectId: projectId!, 
        originalText: content, 
        text: content, 
        toolKey: "BlogIntro")
      );
    }
  }

  Future saveProject()async{

    await showDialog(
      context: context, 
      builder: (_){
        return Dialog(
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              Text('Project name',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
              const SizedBox(
                height: 12,
              ),
              TextInput(
                hintext: 'e.g. My Project', 
                controller: projectNameController
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){  
                  context.back();
                  context.read<TextGenBloc>().add(SaveProject(
                      projectName: projectNameController.text, 
                      name: titleController.text, 
                      tone: toneController.text, 
                      toolKey: "BlogIntro", 
                      description: descriptionController.text, 
                      fromTemplate: true, 
                      templateId: "WriteBlogIntro"
                    )
                  );
                },  
                child: const Text('Save Project')),
            ],
          ),
        );
      });
  }

  void createContent(){

    contents.clear();
    FocusScope.of(context).unfocus();
    context.read<TextGenBloc>().add(
      GenerateContent(
        description: descriptionController.text, 
        title: titleController.text, 
        tone: toneController.text, 
        tool: 'BlogIntro'
      )
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    toneController.dispose();
  }

}