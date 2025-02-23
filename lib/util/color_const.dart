import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talksy/theme/controller/theme_controller.dart';

class ColorConst{
  static Color getWhite(BuildContext context){
    return context.watch<ThemeController>().getThemeMod?Colors.white:Colors.black;
  }
  static Color getBlack(BuildContext context){
    return context.watch<ThemeController>().getThemeMod?Colors.black:Colors.white;
  }
  static Color getSecondryWhite(BuildContext context){
    return context.watch<ThemeController>().getThemeMod?Color(0xFF6B7280):Colors.white60;
  }
  static Color getDeviderColor(BuildContext context){
    return context.watch<ThemeController>().getThemeMod?Colors.grey.shade100:Colors.white30;
  }
}