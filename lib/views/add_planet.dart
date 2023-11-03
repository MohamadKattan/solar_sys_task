import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/component/components.dart';
import 'package:solar_system_task/contrller/contrller_method.dart';
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
      child: Scaffold(
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
                customtTextField(
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
                customtTextField(
                    controller: _planetsRadiusController,
                    label: 'write the  Radius of Planet',
                    onChangedFunction: (val) {
                      if (val.isNotEmpty) {
                        val.trim();
                        double convertVal = double.parse(val.trim());
                        context.read<StateManger>().updateRadius(convertVal);
                      }
                    }),
                customBtn(
                    voidCallback: () => openColorPicker(context),
                    txt: 'Pick a Color',
                    color: Colors.blueAccent),
                customBtn(
                    voidCallback: () => addNewPlanet(context),
                    txt: 'Create a planet',
                    color: Colors.green),
              ]),
        ),
      ),
    );
  }

}


