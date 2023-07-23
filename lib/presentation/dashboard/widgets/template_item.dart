import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/constants/colors_const.dart';
import 'package:mobile/constants/shadow_const.dart';
import 'package:mobile/extensions/context_exten.dart';
import 'package:mobile/network/models/template.dart';
import 'package:mobile/routes/routes.dart';

class TemplateItem extends StatelessWidget {
  final Template template;
  const TemplateItem({
    super.key,
    required this.template  
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.navigateTo(Routes.textgen);
      },
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: ShadowConst.normal,
          color: Colors.white
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.fileLines, size: 20, color: ColorsConst.primary,),
    
                if(template.proFeature)
                Container(
                  decoration: BoxDecoration(
                    color: ColorsConst.primary,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text('Pro', style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorsConst.white
                  )))
              ],
            ),
            const SizedBox(height: 8,),
            Text(template.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorsConst.text1,
              fontSize: 18
            )),
            const SizedBox(height: 8,),
            Text(template.helperText, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}