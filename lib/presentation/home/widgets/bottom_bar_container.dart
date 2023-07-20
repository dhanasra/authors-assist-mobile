import 'package:flutter/material.dart';

import '../../../constants/colors_const.dart';
import '../../../constants/shadow_const.dart';

class BottomBarContainer extends StatelessWidget {
  final Widget child;
  const BottomBarContainer({
    super.key,
    required this.child  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        boxShadow: ShadowConst.normal,
        border: Border.all(
          color: ColorsConst.border,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10),
        color: ColorsConst.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child
      )
    );
  }
}