part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardFetchingItems extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardItemsLoaded extends DashboardState {
  final List<ReportModel> items;

  DashboardItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class DashboardFetchError extends DashboardState {
  final String error;

  DashboardFetchError(this.error);

  @override
  List<Object> get props => [error];
}
