import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/component/ctm_btn.dart';
import 'package:solar_system_task/component/ctm_text_field.dart';
import 'package:solar_system_task/contrller/add_new_planet.dart';
import 'package:solar_system_task/contrller/pick_color.dart';
import 'package:solar_system_task/contrller/state_manger.dart';

class AddPlanet extends StatefulWidget {
  const AddPlanet({super.key});

  @override
  State<AddPlanet> createState() => _AddPlanetState();
}

class _AddPlanetState extends State<AddPlanet> {
  late TextEditingController _speedPlanerController;
  late TextEditingController _planetsRadiusController;
  @override
  void initState() {
    _speedPlanerController = TextEditingController();
    _planetsRadiusController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _speedPlanerController.dispose();
    _planetsRadiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create new planet'),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Enter val that you want\n Than click create btn\n == or ==\nclick creat btn to create defult planet ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomtTextField(
                      controller: _speedPlanerController,
                      label: 'write the speed of Planet',
                      onChangedFunction: (val) {
                        if (val.isNotEmpty) {
                          val.trim();
                          double convertVal = double.parse(val.trim());
                          context.read<StateManger>().updateSpeed(convertVal);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomtTextField(
                      controller: _planetsRadiusController,
                      label: 'write the  Radius of Planet',
                      onChangedFunction: (val) {
                        if (val.isNotEmpty) {
                          if (val.isNotEmpty) {
                            val.trim();
                            double convertVal = double.parse(val.trim());
                            context
                                .read<StateManger>()
                                .updateRadius(convertVal);
                          }
                        }
                      },
                    ),
                  ),
                  CustomBtn(
                      voidCallback: () => PickColor().openColorPicker(context),
                      txt: 'Pick a Color',
                      color: Colors.blueAccent),
                  CustomBtn(
                      voidCallback: () => AddNewPlanet().add(context),
                      txt: 'Create a planet',
                      color: Colors.green),
                ]),
          ),
        );
      }),
    );
  }
}
