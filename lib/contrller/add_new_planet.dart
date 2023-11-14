import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/contrller/state_manger.dart';
import 'package:solar_system_task/error_handler/error_handler.dart';
import 'package:solar_system_task/models/planeta.dart';
import 'package:solar_system_task/views/home_page.dart';

class AddNewPlanet {
  void add(BuildContext context) {
    final stateLisner = Provider.of<StateManger>(context, listen: false);
    if (stateLisner.listOfPlanet.length < 9) {
      Planeta planeta = Planeta(
          planetsRadius: stateLisner.radius,
          planetsColor: stateLisner.pickColor,
          planetSpeed: stateLisner.speed);

      stateLisner.updateListOfPlaneta(planeta);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false);
    } else {
      ErrorHandler().errorMsg('Max the planets is 9 can\'t add more');
    }
  }
}
