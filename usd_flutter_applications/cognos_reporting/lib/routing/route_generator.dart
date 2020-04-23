import 'package:flutter/material.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/result_table/result_table_view.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/routing/routes.dart';
import 'package:usd_flutter_modules/ui/app_bar/app_bar.dart';
import './string_extensions.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routingData = settings.name.getRoutingData;

    switch (routingData.route) {
      case Routes.dashboard:
        final view = DashboardView();
        return _getPageRoute(view, settings);
      case Routes.reportRunner:
        final id = int.tryParse(routingData['id']);
        final view = ReportRunnerView(reportId: id);
        return _getPageRoute(view, settings);
      case Routes.reportResults:
        final id = int.tryParse(routingData['id']);
        final view = ReportRunnerResultTableView();
        return _getPageRoute(view, settings);
      default:
        return _errorRoute();
    }
  }

  static PageRoute _getPageRoute(Widget child, RouteSettings settings) {
    return PageRouteBuilder(
      settings: RouteSettings(name: settings.name),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          child,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
