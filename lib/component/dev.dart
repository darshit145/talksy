import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talksy/theme/controller/theme_controller.dart';

Widget globalFloat(BuildContext ct){
  return FloatingActionButton(onPressed: () {
    ct.read<ThemeController>().toggleTheme();
  },);
}