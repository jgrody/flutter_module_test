part of 'report_runner_bloc.dart';

abstract class ReportRunnerEvent extends Equatable {
  const ReportRunnerEvent();
}

class ReportRunnerGetReport extends ReportRunnerEvent {
  final int reportId;

  ReportRunnerGetReport({
    @required this.reportId
  });

  @override
  List<Object> get props => [reportId];
}


class ReportRunnerGetAcademicPeriods extends ReportRunnerEvent {
  @override
  List<Object> get props => [];
}

class ReportRunnerGetCourseIDRecords extends ReportRunnerEvent {
  final String academicPeriod;

  ReportRunnerGetCourseIDRecords(this.academicPeriod);

  @override
  List<Object> get props => [academicPeriod];
}