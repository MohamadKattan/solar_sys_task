import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/contrller/paint_planets.dart';
import 'package:solar_system_task/contrller/state_manger.dart';
import 'dart:math';
import 'package:solar_system_task/views/add_planet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late List<AnimationController> _listAnimationController;
  late AnimationController _sunAnmationCountraller;
  late AnimationController _animationController;

  @override
  void initState() {
    _listAnimationController = [];

    _createSunAnimation();

    _createPlanetAnimation();

    super.initState();
  }

  void _createSunAnimation() {
    _sunAnmationCountraller = AnimationController(
        vsync: this, duration: const Duration(seconds: 10), upperBound: 2 * pi);

    _sunAnmationCountraller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _sunAnmationCountraller.repeat();
      }
    });
    _sunAnmationCountraller.forward();
  }

  void _createPlanetAnimation() {
    final value = Provider.of<StateManger>(context, listen: false);
    if (value.listOfPlanet.isNotEmpty) {
      for (var i = 0; i < value.listOfPlanet.length; i++) {
        _animationController = AnimationController(
            vsync: this,
            duration: Duration(
                milliseconds:
                    ((value.listOfPlanet[i].planetSpeed / 365) * 1000).floor()),
            upperBound: 2 * pi)
          ..forward();

        _listAnimationController.add(_animationController);
      }
    }
  }

  void _repatePlanetAnmation(List list) {
    for (var i in list) {
      i.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          i.repeat();
        }
      });
      i.forward();
    }
  }

  @override
  void dispose() {
    for (AnimationController c in _listAnimationController) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Soler system task'),
              centerTitle: false,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const AddPlanet()));
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            body: InteractiveViewer(
              maxScale: 10,
              child: Consumer<StateManger>(
                builder: (BuildContext context, value, Widget? child) {
                  return AnimatedBuilder(
                      animation: _sunAnmationCountraller,
                      builder: (context, child) {
                        for (var i = 0; i < value.listOfPlanet.length; i++) {
                          value.listOfPlanet[i].planetsangle =
                              _listAnimationController[i].value;
                        }
                        _repatePlanetAnmation(_listAnimationController);
                        return CustomPaint(
                          painter: SolerSystem(value.listOfPlanet),
                          child: Container(),
                        );
                      });
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
