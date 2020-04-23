
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/course_identification/course_identification_model.dart';

getCourseJson(){
  var start = 0;
  List<CourseIDModel> _list = List();
  List<int> list = List<int>.generate(40, (index) => index + 1).toList();
  for (final item in list) {
    _list.add(CourseIDModel.fromJson({"name": "BIOL ${100 + start}"}));
    start++;
  }
  return _list.toList();
}

