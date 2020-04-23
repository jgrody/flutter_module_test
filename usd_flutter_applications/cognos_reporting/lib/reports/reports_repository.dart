import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/academic_periods/academic_period_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/academic_periods/academic_periods_json.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/course_identification/course_identification_json.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/course_identification/course_identification_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_json.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_model.dart';

class ReportsRepository {
  Future<List<ReportModel>> getReports() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return reportJson.map((e) => ReportModel.fromJson(e)).toList();
    });
  }

  Future<ReportModel> getReport(int id) {
    return Future.delayed(
      Duration(milliseconds: 500),
      () {
        Map<String, dynamic> report =
            reportJson.where((report) => report['id'] == id).toList().first;
        return ReportModel.fromJson(report);
      },
    );
  }

  Future<List<AcademicPeriodModel>> getAcademicPeriods() {
    return Future.delayed(
      Duration(milliseconds: 500),
      () {
        return academicPeriodsJson
            .map((e) => AcademicPeriodModel.fromJson(e))
            .toList();
      },
    );
  }

  Future<List<CourseIDModel>> getCourseIDRecords() {
    var json = getCourseJson();
    return Future.delayed(
      Duration(milliseconds: 500),
      () {
        return json;
      },
    );
  }
}
