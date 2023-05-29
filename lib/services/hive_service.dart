import 'package:health_steshkin/models/workout_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService{

  static initHive() async{
    final applicationDoucmentDir =
    await path_provider.getApplicationDocumentsDirectory();

    Hive..init(applicationDoucmentDir.path)..registerAdapter(WorkoutModelAdapter());

    Hive.openBox<WorkoutModel>('workout');
  }
}