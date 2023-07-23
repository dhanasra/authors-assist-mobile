import 'package:flutter/material.dart';
import 'package:mobile/constants/colors_const.dart';
import 'package:mobile/presentation/textgen/pages/textgen_viewmodel.dart';

class ContentHeader extends StatelessWidget {
  final String content;
  final TextGenViewModel viewModel;
  const ContentHeader({
    super.key,
    required this.content,
    required this.viewModel  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        InkWell(
          onTap: (){

          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.edit, size: 16, color: ColorsConst.text1,),
              const SizedBox(width: 8,),
              Text('Edit', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: ColorsConst.text1
              ))
            ],
          ),
        ),
      ],
    );
  }
}