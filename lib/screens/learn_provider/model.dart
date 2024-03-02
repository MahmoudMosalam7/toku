import 'package:flutter/material.dart';

class UserModel{
  String? name,email;
  UserModel({
    this.name,
    this.email
});

}

class RiverpodModel extends ChangeNotifier{
  int counter;
  RiverpodModel({
    required this.counter
});
  void addCounter(){
    counter++;
    notifyListeners();
  }

  void removeCounter(){
    counter--;
    notifyListeners();
  }
}