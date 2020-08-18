import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends ChangeNotifier{
  double _totalPrice = 0;
  double _yuan = 198 ;
  
  List<String> _percentage = ['15','20'];

  void DataInit() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('percentage', _percentage);
    prefs.setDouble('yuan',_yuan);
    _percentage = prefs.getStringList('percentage');
    _yuan = prefs.getDouble('yuan');
  }

 double get totalPrice{
   return _totalPrice;
 }

 void setTotalPrice(double totalPrice)
 {
   _totalPrice = totalPrice;
   notifyListeners();
 }

 double get yuan{
    return _yuan;
}

void setYuan(double yuan) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setDouble('yuan', yuan);
  _yuan = yuan;
  notifyListeners();
}

List<DropdownMenuItem> get percentage{
   List<DropdownMenuItem> percentageList = [];
   for(String percentage in _percentage)
    percentageList.add(DropdownMenuItem(
      child: Text(percentage),
      value: percentage,
    ),);

   return percentageList;
}

void addPercentage(String newPercentage)
async{
  _percentage.add(newPercentage);
  var prefs = await SharedPreferences.getInstance();
  prefs.setStringList('percentage', _percentage);
  notifyListeners();
}



}