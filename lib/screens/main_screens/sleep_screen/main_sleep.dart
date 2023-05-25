import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/controllers/sleep_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SleepScreen extends StatefulWidget {
  final globalVar goTR;
  const SleepScreen(this.goTR, {super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SleepController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'HealthApp',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 24,
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
                icon: Icon(Icons.account_circle));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.goTR.goToRoute(AllRoutes.sleep_add);
              }, splashRadius: 24, icon: Icon(Icons.add_alarm))
        ],
      ),
      body: FutureBuilder(
          future: controller.getAllSleepRecords(),
          builder: (context, snapshotSleep) {
            if(snapshotSleep.connectionState == ConnectionState.done){
              if(snapshotSleep.data!.length > 0 && snapshotSleep.hasData){
                return Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Column(
                    children: [
                      Text('Сон',
                        style: TextStyle(
                          fontSize: 37,
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                          itemCount: snapshotSleep.data!.length,
                          itemBuilder: (c, index){
                          return ListTile(
                            iconColor: Colors.white,
                            tileColor: Colors.blueGrey,
                            leading: const Icon(LineAwesomeIcons.clock),
                            title: Text(
                                '${snapshotSleep.data![index].Date_record}',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshotSleep.data![index].Duration.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: Colors.white,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                Text(snapshotSleep.data![index].Status.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                              ],
                            ),
                          );
                          }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                      ),
                    ],
                  ),
                );
              } else{
                return Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Сон',
                          style: TextStyle(
                            fontSize: 37,
                            fontFamily: 'Rubik',
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text('Нет записей',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Rubik',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 35,),
                        Text('Нажмите на кнопку "+" в верхней части экрана, чтобы добавить новую запись',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}
