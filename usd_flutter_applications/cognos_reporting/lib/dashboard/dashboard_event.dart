part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardGetItems extends DashboardEvent {
  @override
  List<Object> get props => [];
}
