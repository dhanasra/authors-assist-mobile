import 'package:flutter/material.dart';

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
        boxShadow: ShadowConst.normal(context),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child
      )
    );
  }
}