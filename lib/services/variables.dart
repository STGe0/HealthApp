//Определение глобальных переменных
import 'package:health_steshkin/models/user_model.dart';

class globalVar{
  final String thisRoute;
  final Function goToRoute;

  globalVar(this.thisRoute, this.goToRoute);
}

class isReg{
  static bool isRegis = false;
}