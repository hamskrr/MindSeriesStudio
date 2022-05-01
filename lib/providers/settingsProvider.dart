import 'package:flutter/cupertino.dart';

import '../models/setting.dart';

class SettingProvider extends ChangeNotifier{
  Setting setting = Setting();

  updateSetting(Setting setting){
    this.setting = setting;
    notifyListeners();
  }
}