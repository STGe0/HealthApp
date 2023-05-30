import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:health_steshkin/services/controllers/profile_controller.dart';
import 'package:health_steshkin/services/controllers/sleep_controller.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class WorkoutPage extends StatefulWidget {
  final globalVar goTR;

  const WorkoutPage(this.goTR, {super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final user = FirebaseAuth.instance.currentUser;

  final controller = Get.put(SleepController());
  final controllerUser = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 35, 36),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Тренировка',
            style: TextStyle(
                fontFamily: 'Rubik',
                color: Colors.white,
                fontSize: 32,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              splashRadius: 24,
              onPressed: () {
                widget.goTR.goToRoute(AllRoutes.strength);
              },
              icon: Icon(LineAwesomeIcons.angle_left),
            );
          }),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Дома',
              icon: Icon(LineAwesomeIcons.home),
            ),
            Tab(
              text: 'В зале',
              icon: Icon(LineAwesomeIcons.dumbbell),
            ),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //Дома
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text(
                          workoutVar.workoutTitle + ' дома',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 34,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          workoutVar.description,
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 26,
                              fontStyle: FontStyle.normal,),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        Divider(color: Colors.white,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Вам понадобится',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '3 предмета',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        SizedBox(
                          height: width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          color: Colors.white,
                                          child: Image.asset(workoutVar.asset1),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(workoutVar.item1,
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          color: Colors.white,
                                          child: Image.asset(workoutVar.asset2),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(workoutVar.item2,
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          color: Colors.white,
                                          child: Image.asset(workoutVar.asset3),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(workoutVar.item3,
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Упражнения',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '4 сета',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('1 Сет включает в себя:',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 26,
                                fontStyle: FontStyle.normal,),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(
                            children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVar.asset4
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVar.work1,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVar.work_1,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(
                            children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVar.asset5
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVar.work2,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVar.work_2,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVar.asset6
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVar.work3,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVar.work_3,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVar.asset7
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVar.work4,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVar.work_4,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){},
                          child: Text('Записать',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 24,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                            minimumSize: Size(250, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //В зале
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        //В зале
                        Text(
                          workoutVarGym.workoutTitle + ' в зале',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 34,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        //Описание тренировки
                        Text(
                          workoutVarGym.description,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 26,
                            fontStyle: FontStyle.normal,),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        //Разделитель
                        Divider(color: Colors.white,),
                        SizedBox(height: 10,),
                        //Вам понадобится
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Вам понадобится',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '4 предмета',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        SizedBox(
                          height: width*0.4,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                              children: [
                                //1 предмет
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                        child: Image.asset(workoutVarGym.asset1),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(workoutVarGym.item1,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15,),
                                //2 предмет
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                        child: Image.asset(workoutVarGym.asset2),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(workoutVarGym.item2,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15,),
                                //3 предмет
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                        child: Image.asset(workoutVarGym.asset3),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(workoutVarGym.item3,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15,),
                                //4 предмет
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                        child: Image.asset(workoutVarGym.asset4_1),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(workoutVarGym.item4,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),]
                          ),
                        ),
                        //Упражнения, 4 сета
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Упражнения',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '4 сета',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('1 Сет включает в себя:',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 26,
                                fontStyle: FontStyle.normal,),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        //1 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                      workoutVarGym.asset4
                                  ),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(workoutVarGym.work1,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(workoutVarGym.work_1,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,),
                                  ),
                                ],
                              ),
                            ],),
                        ),
                        SizedBox(height: 10,),
                        //2 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                      workoutVarGym.asset5
                                  ),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(workoutVarGym.work2,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(workoutVarGym.work_2,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,),
                                  ),
                                ],
                              ),
                            ],),
                        ),
                        SizedBox(height: 10,),
                        //3 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVarGym.asset6
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVarGym.work3,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVarGym.work_3,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        //4 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVarGym.asset7
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVarGym.work4,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVarGym.work_4,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        //5 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVarGym.asset8
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVarGym.work5,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVarGym.work_5,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 10,),
                        //6 упражнение
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                          ),
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: AssetImage(
                                    workoutVarGym.asset9
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workoutVarGym.work6,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Text(workoutVarGym.work_6,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,),
                                ),
                              ],
                            ),
                          ],),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){},
                          child: Text('Записать',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 24,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                            minimumSize: Size(250, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}