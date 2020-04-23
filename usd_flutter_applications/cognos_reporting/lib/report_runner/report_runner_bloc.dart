import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/academic_periods/academic_period_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/course_identification/course_identification_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/reports_repository.dart';

part 'report_runner_event.dart';
part 'report_runner_state.dart';

class ReportRunnerBloc extends Bloc<ReportRunnerEvent, ReportRunnerState> {
  final ReportsRepository _reportsRepository;

  ReportRunnerBloc({@required ReportsRepository reportsRepository})
      : assert(reportsRepository != null),
        _reportsRepository = reportsRepository;

  @override
  ReportRunnerState get initialState => ReportRunnerInitial();

  @override
  Stream<ReportRunnerState> mapEventToState(
    ReportRunnerEvent event,
  ) async* {
    if (event is ReportRunnerGetReport) {
      yield* _mapReportRunnerGetReportToState(event.reportId);
    } else if (event is ReportRunnerGetAcademicPeriods) {
      yield* _mapReportRunnerGetAcademicPeriodsToState();
    } else if (event is ReportRunnerGetCourseIDRecords) {
      yield* _mapReportRunnerGetCourseIDRecordsToState(event.academicPeriod);
    }
  }

  Stream<ReportRunnerState> _mapReportRunnerGetReportToState(
      int reportId) async* {
    try {
      yield ReportRunnerFetchingReport();
      yield ReportRunnerFetchSuccess(
          await _reportsRepository.getReport(reportId));
    } catch (e) {
      yield ReportRunnerFetchFailure();
    }
  }

  Stream<ReportRunnerState> _mapReportRunnerGetAcademicPeriodsToState() async* {
    try {
      yield ReportRunnerFetchingAcademicPeriods();
      yield ReportRunnerGetAcademicPeriodsSuccess(
          await _reportsRepository.getAcademicPeriods());
    } catch (e) {
      yield ReportRunnerGetAcademicPeriodsFailure();
    }
  }

  Stream<ReportRunnerState> _mapReportRunnerGetCourseIDRecordsToState(
      String academicPeriod) async* {
    try {
      yield ReportRunnerFetchingCourseIDRecords();
      yield ReportRunnerGetCourseIDRecordsSuccess(
          await _reportsRepository.getCourseIDRecords());
    } catch (e) {
      yield ReportRunnerGetCourseIDRecordsFailure();
    }
  }
}
