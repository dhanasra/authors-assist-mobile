import 'package:flutter/cupertino.dart';

import 'colors_const.dart';

class ShadowConst {

  ShadowConst._();

  static const normal = [
    BoxShadow(
      color: ColorsConst.border,
      offset: Offset(4, 4),
      blurRadius: 12
    ),
    BoxShadow(
      color: ColorsConst.border,
      offset: Offset(-4, -4),
      blurRadius: 12
    ),
  ];

  static const spreaded = [
    BoxShadow(
      color: ColorsConst.border,
      offset: Offset(4, 4),
      blurRadius: 20
    ),
    BoxShadow(
      color: ColorsConst.border,
      offset: Offset(-4, -4),
      blurRadius: 20
    ),
  ];

  static const dark = [
    BoxShadow(
      color: ColorsConst.shadow,
      offset: Offset(0, 0),
      blurRadius: 12
    )
  ];

}