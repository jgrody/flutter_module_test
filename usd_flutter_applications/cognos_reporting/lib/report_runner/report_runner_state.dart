part of 'report_runner_bloc.dart';

abstract class ReportRunnerState extends Equatable {
  final ReportModel report;

  ReportRunnerState({this.report});

  @override
  List<Object> get props => [report];
}

class ReportRunnerInitial extends ReportRunnerState { }

class ReportRunnerFetchingReport extends ReportRunnerState { }

class ReportRunnerFetchSuccess extends ReportRunnerState {
  final ReportModel report;

  ReportRunnerFetchSuccess(this.report);

  @override
  List<Object> get props => [report];
}

class ReportRunnerFetchFailure extends ReportRunnerState { }


class ReportRunnerFetchingAcademicPeriods extends ReportRunnerState { }

class ReportRunnerGetAcademicPeriodsSuccess extends ReportRunnerState {
  final List<AcademicPeriodModel> periods;

  ReportRunnerGetAcademicPeriodsSuccess(this.periods);

  @override
  List<Object> get props => [periods];
}

class ReportRunnerGetAcademicPeriodsFailure extends ReportRunnerState { }

class ReportRunnerFetchingCourseIDRecords extends ReportRunnerState { }
class ReportRunnerGetCourseIDRecordsSuccess extends ReportRunnerState {
  final List<CourseIDModel> courseIDs;

  ReportRunnerGetCourseIDRecordsSuccess(this.courseIDs);

  @override
  List<Object> get props => [courseIDs];
}

class ReportRunnerGetCourseIDRecordsFailure extends ReportRunnerState { }
