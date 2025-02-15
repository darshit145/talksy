import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talksy/theme/controller/theme_controller.dart';

class ColorConst{
  static Color getWhite(BuildContext context){
    return context.watch<ThemeController>().getThemeMod?Color(0xFF54561):Color(0xFF122145);
  }
}