import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/controllers/profile_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountScreen extends StatefulWidget{
  final globalVar  goTR;
  const AccountScreen(this.goTR, {super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{

  Future<void> signOut() async{
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/start_main', (route) => false);
  }

  Color imtColor(double imt){
    if(imt >= 25){
      return const Color.fromARGB(244, 255, 0, 0);
    } else{
      if(imt <= 24.9 && imt >=18.4){
        return const Color.fromARGB(255, 2, 181, 49);
      } else return const Color.fromARGB(255, 234, 37, 37);
    }
  }

  String imtTitle(double imt){
    if(imt >= 25){
      return 'Повышенная масса тела';
    } else{
      if(imt <= 24.9 && imt >=18.4){
        return 'Нормальная масса тела';
      } else return 'Недостаточная масса тела';
    }
  }

  @override
  Widget build(BuildContext context){
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Профиль',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 24,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                splashRadius: 24,
                onPressed: () {
                  foodPageCal.blbl = true;
                  widget.goTR.goToRoute(AllRoutes.food);
                },
                icon: Icon(LineAwesomeIcons.angle_left)
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Center(
                        child: Text('ИМТ',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Center(
                        child: SizedBox(
                          height: 110,
                          child: PieChart(
                              PieChartData(
                                  centerSpaceRadius: 24,
                                  centerSpaceColor: Colors.white,
                                  borderData: FlBorderData(show: false),
                                  sections: [
                                    PieChartSectionData(
                                        value: (
                                            double.parse(userData.imt.toString())/10),
                                        color: imtColor(double.parse(userData.imt.toString())),
                                        radius: 18, title:
                                    userData.imt.toString(),
                                        titleStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)
                                    ),
                                    PieChartSectionData(value: 2, color: Colors.transparent, radius: 18, title: ''),
                                  ]
                              )
                          ),
                        ),
                      ),
                      Center(
                        child: Text(imtTitle(double.parse(userData.imt.toString())),
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                          ),),
                      ),
                      SizedBox(height: 20,),
                      Text('Логин: ' + userData.fullName.toString(),
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Почта: ' + userData.email.toString(),
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(onPressed: () {
                          widget.goTR.goToRoute(AllRoutes.account_update);
                        },
                          child: Text('Редактировать',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MenuProfileButton(title: 'Настройки', icon: LineAwesomeIcons.cog, textColor: Colors.white, onPress: (){widget.goTR.goToRoute(AllRoutes.settings);},),
                      SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuProfileButton(title: 'Информация', icon: LineAwesomeIcons.info, textColor: Colors.white, onPress: (){
                        widget.goTR.goToRoute(AllRoutes.info_page);
                      },),
                      SizedBox(
                        height: 10,
                      ),
                      MenuProfileButton(
                        title: 'Выход',
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.red.shade300,
                        onPress: () {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.blueGrey,
                                  title: Text(
                                    'Выход из аккаунта',
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  content: const Text(
                                    'Вы точно хотите выйти из аккаунта?',
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        try{
                                          signOut();
                                          Navigator.of(context).pop();
                                        }
                                        catch(e){
                                        }
                                      },
                                      child: Text(
                                        'Да',
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black12,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Отменить',
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black12,
                                      ),
                                    ),
                                  ],
                                );
                              });
                          },
                        endIcon: false,),
                    ],
                  );
                } else{
                  if(snapshot.hasError){
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else{
                    return const Center(
                      child: Text("Что-то пошло не так"),
                    );
                  }
                }
              } else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class MenuProfileButton extends StatelessWidget {
  const MenuProfileButton({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    required this.onPress,
    this.endIcon = true,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey,
        ),
        child: Icon(icon,
          color: Colors.white,
        ),
      ),
      title: Text(title,
        style: TextStyle(
            fontFamily: 'Ubuntu',
            color: textColor,
            fontSize: 22,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.1),
        ),
        child: const Icon(LineAwesomeIcons.angle_right,
          size: 18,
          color: Colors.white,
        ),
      ) : null,
    );
  }
}