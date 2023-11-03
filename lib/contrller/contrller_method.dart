import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/contrller/state_manger.dart';
import 'package:solar_system_task/models/planeta.dart';
import 'package:solar_system_task/views/home_page.dart';

// open and pick color p;anet
void openColorPicker(BuildContext context) {
  showDialog(
    builder: (context) => AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: context.watch<StateManger>().pickColor,
          onColorChanged: (color) {
            context.read<StateManger>().updateColor(color);
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            // setState(() => currentColor = pickerColor);
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    context: context,
  );
}

void addNewPlanet(BuildContext context) {
  final stateLisner = Provider.of<StateManger>(context, listen: false);
  if (stateLisner.listOfPlanet.length < 9) {
    Planeta planeta = Planeta(
        planetsRadius: stateLisner.radius,
        planetsColor: stateLisner.pickColor,
        planetSpeed: stateLisner.speed);

    stateLisner.updateListOfPlaneta(planeta);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
  } else {
    errorMsg('Max the planets is 9 can\'t add more');
  }
}

void errorMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

// this function for paint sun by defult
void paintSun(Canvas canvas, Size size) {
  final sunColor = Paint()
    ..color = Colors.amberAccent.shade700
    ..style = PaintingStyle.fill;
  canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40.0, sunColor);
}

// this function for add new Planeta
void addPlaneta({
  required Canvas canvas,
  required Size size,
  required List<Planeta> list,
}) {
  double orbitRadius = 60;
  for (var i = 0; i < list.length; i++) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        orbitRadius,
        Paint()
          ..color = list[i].planetsColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          );

    canvas.drawCircle(
        Offset(size.width / 2 + orbitRadius * cos(list[i].planetsangle),
            size.height / 2 + orbitRadius * sin(list[i].planetsangle)),
        list[i].planetsRadius,
        Paint()
          ..color = list[i].planetsColor
          ..style = PaintingStyle.fill);
    orbitRadius += 25;
  }
}

// this class for  paint soler system
class SolerSystem extends CustomPainter {
  List<Planeta> listOfPlanet;
  SolerSystem(this.listOfPlanet);
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    paintSun(canvas, size);
    addPlaneta(
      canvas: canvas,
      size: size,
      list: listOfPlanet,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void repatePlanetAnmation(List list) {
  for (var i in list) {
    i.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        i.repeat();
      }
    });
    i.forward();
  }
}
