import 'package:flutter/material.dart';
import 'package:mobile/constants/colors_const.dart';
import 'package:mobile/presentation/textgen/pages/textgen_viewmodel.dart';
import 'package:share_plus/share_plus.dart';

class ContentFooter extends StatelessWidget {
  final String content;
  final TextGenViewModel viewModel;
  const ContentFooter({
    super.key,
    required this.content,
    required this.viewModel  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: ()=>viewModel.copyContent(content), 
                splashRadius: 24,
                icon: const Icon(Icons.copy, size: 20, color: ColorsConst.text1,)),
              IconButton(
                onPressed: ()=>viewModel.saveContent(content),
                splashRadius: 24,
                icon: const Icon(Icons.favorite_border, size: 20, color: ColorsConst.text1,)),
              IconButton(
                onPressed: ()=>Share.share(content, subject: 'Look what I made!'),
                splashRadius: 24,
                icon: const Icon(Icons.share, size: 20, color: ColorsConst.text1,))
            ],
          ),
        ),

        TextButton(
          onPressed: ()=>viewModel.editContent(content), 
          style: Theme.of(context).textButtonTheme.style!.copyWith(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(0))
          ),
          child: const Text('Edit')),
      ],
    );
  }
}