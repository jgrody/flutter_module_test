part of 'report_runner_form_bloc.dart';

abstract class ReportRunnerFormEvent extends Equatable {
  const ReportRunnerFormEvent();
}

class ReportRunnerFormSelectAcademicPeriod extends ReportRunnerFormEvent {
  final String academicPeriod;

  ReportRunnerFormSelectAcademicPeriod(this.academicPeriod);

  @override
  List<Object> get props => [academicPeriod];
}

class ReportRunnerFormToggleCourseId extends ReportRunnerFormEvent {
  final String courseID;
  final bool value;

  ReportRunnerFormToggleCourseId(
    this.courseID,
    this.value,
  );

  @override
  List<Object> get props => [courseID, value];
}
