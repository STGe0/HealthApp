import 'package:flutter/material.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class SettingsScreen extends StatefulWidget{
  final globalVar  goTR;
  const SettingsScreen(this.goTR, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>{
  bool value = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Настройки',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                splashRadius: 24,
                onPressed: () {
                  widget.goTR.goToRoute(AllRoutes.account);
                },
                icon: Icon(LineAwesomeIcons.angle_left));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text('Push-уведомления',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Switch.adaptive(
                      value: value,
                      onChanged: (newValue) => setState(() => value = newValue),
                      inactiveTrackColor: Colors.blueGrey,
                      activeColor: Colors.lightGreenAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}