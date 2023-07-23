import 'package:flutter/material.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/widgets/text_input.dart';

class EditContentSheet extends StatelessWidget {
  final String content;
  final ValueChanged onSaveClick;
  final ValueChanged onCopyClick;
  const EditContentSheet({
    super.key,
    required this.content,
    required this.onSaveClick,  
    required this.onCopyClick  
  });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController(text: content);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Edit content',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
        const SizedBox(
          height: 12,
        ),
        TextInput(
          hintext: '', 
          controller: textController,
          maxLines: 8,
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => onCopyClick(textController.text),
                child: const Text('Copy')),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: OutlinedButton(
                onPressed: (){
                  context.back();
                  onSaveClick(textController.text);
                },
                child: const Text('Save')),
            )
          ],
        ),
      ],
    );
  }
}