import 'package:flutter/cupertino.dart';

class IntroScreenController extends ChangeNotifier{
  int index=0;
  void changePageTo(int to){
    index=to;
    notifyListeners();
  }
}