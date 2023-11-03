import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solar_system_task/models/planeta.dart';

class StateManger with ChangeNotifier, DiagnosticableTreeMixin {
  double _speed = 365;
  double get speed => _speed;

  void updateSpeed(double state) {
    _speed = state;
    notifyListeners();
  }

  double _radius = 10;
  double get radius => _radius;

  void updateRadius(double state) {
    _radius = state;
    notifyListeners();
  }

  Color _pickColor = Colors.blue;
  Color get pickColor => _pickColor;

  void updateColor(Color state) {
    _pickColor = state;
    notifyListeners();
  }

  final List<Planeta> _listOfPlanet = [];
  List<Planeta> get listOfPlanet => _listOfPlanet;

  void updateListOfPlaneta(Planeta planeta) {
    _listOfPlanet.add(planeta);
    notifyListeners();
  }
}
