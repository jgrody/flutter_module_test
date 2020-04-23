import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'report_runner_form_event.dart';
part 'report_runner_form_state.dart';

class ReportRunnerFormBloc
    extends Bloc<ReportRunnerFormEvent, ReportRunnerFormState> {
  @override
  ReportRunnerFormState get initialState => ReportRunnerFormState.initial();

  @override
  Stream<ReportRunnerFormState> mapEventToState(
    ReportRunnerFormEvent event,
  ) async* {
    if (event is ReportRunnerFormSelectAcademicPeriod) {
      yield state.update(
        academicPeriod: event.academicPeriod,
      );
    } else if (event is ReportRunnerFormToggleCourseId) {
      yield* _mapReportRunnerFormToggleCourseIdToState(
        event.courseID,
        event.value,
      );
    }
  }

  Stream<ReportRunnerFormState> _mapReportRunnerFormToggleCourseIdToState(
    String courseId,
    bool value,
  ) async* {
    // Create a new map to manipulate
    final Map<String, bool> _map = new Map.from(state.availableCourseIDs);

    // Change the value
    _map[courseId] = value;

    // Reset state's availableCourseIDs to map
    yield state.update(availableCourseIDs: _map);
  }
}
