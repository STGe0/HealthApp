import 'package:flutter/material.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class InfoScreen extends StatefulWidget{
  final globalVar  goTR;
  const InfoScreen(this.goTR, {super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Информация',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Индекс Массы Тела (ИМТ)',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25,),
              Text('Показатель, при помощи которого Вы можете проверить соответствие между массой Вашего тела и Вашим ростом и узнать, имеется ли у Вас избыточный вес, или же наоборот, не страдаете ли вы недостатком веса.',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 25,),
              Text('Данная информация может быть полезна для начинающего пользователя, так как для оценки телосложения профессиональных спортсменов используются другие параметры (%жира, количество сухой мышечной массы и т.д.)',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 25,),
              Text('Используемая формула подсчета',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 25,),
              Text('ИМТ = Масса Тела (кг) / Рост (м) * Рост (м)',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25,),
              Text('Классификация ИМТ',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25,),
              Text('Меньше 18.5 - Недостаточная масса тела',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 10,),
              Text('18.5 - 25 - Нормальная масса тела',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 10,),
              Text('25 и больше - Избыточная масса тела',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}