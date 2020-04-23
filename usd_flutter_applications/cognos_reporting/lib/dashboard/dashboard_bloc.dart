import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/reports_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ReportsRepository _reportsRepository;

  DashboardBloc({
    @required ReportsRepository reportsRepository
  }) : assert(reportsRepository != null),
    _reportsRepository = reportsRepository;

  @override
  DashboardState get initialState => DashboardInitial();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is DashboardGetItems) {
      yield* _mapDashboardGetItemsToState();
    }
  }

  Stream<DashboardState> _mapDashboardGetItemsToState() async* {
    try {
      yield DashboardFetchingItems();
      final List<ReportModel> _results = await _reportsRepository.getReports();
      yield DashboardItemsLoaded(_results);
    } catch(e) {
      yield DashboardFetchError(e);
    }
  }
}




