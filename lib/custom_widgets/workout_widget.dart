import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:health_steshkin/services/variables.dart';

class WorkoutWidget extends StatefulWidget {
  final String titleText;
  final String descriptionWorkout;
  final String pathAsset;
  final VoidCallback onPress;
  const WorkoutWidget(this.titleText, this.descriptionWorkout, this.pathAsset, this.onPress, {Key? key}) : super(key: key);

  @override
  State<WorkoutWidget> createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget>{

  void _onPressBut(String title) {
    setState(() {
      workoutVar.workoutTitle = title;
    });
}

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                  widget.pathAsset
              ),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.titleText,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(widget.descriptionWorkout,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            splashRadius: 24,
              onPressed:
              widget.onPress,
              icon: Icon(LineAwesomeIcons.alternate_arrow_circle_right,
              color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}