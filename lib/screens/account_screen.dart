import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/services/all_routes.dart';
import 'package:health_steshkin/services/profile_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountScreen extends StatefulWidget{
  final globalVar  goTR;
  const AccountScreen(this.goTR, {super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async{
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/start_main', (route) => false);
  }

  @override
  Widget build(BuildContext context){
    final navigator = Navigator.of(context);
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
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: AssetImage('assets/image/account.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blueGrey),
                              child: const Icon(LineAwesomeIcons.alternate_pencil,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(userData.fullName.toString(),
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      Text(userData.email.toString(),
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(onPressed: () {
                          widget.goTR.goToRoute(AllRoutes.account_update);
                        },
                          child: Text('Редактировать',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
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
                        height: 10,
                      ),
                      MenuProfileButton(title: 'Настройки', icon: LineAwesomeIcons.cog, textColor: Colors.white, onPress: (){},),
                      SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuProfileButton(title: 'Информация', icon: LineAwesomeIcons.info, textColor: Colors.white, onPress: (){},),
                      SizedBox(
                        height: 10,
                      ),
                      MenuProfileButton(title: 'Выход', icon: LineAwesomeIcons.alternate_sign_out, textColor: Colors.red.shade300, onPress: () => signOut(), endIcon: false,),
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
          fontFamily: 'Rubik',
          color: textColor,
        ),
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