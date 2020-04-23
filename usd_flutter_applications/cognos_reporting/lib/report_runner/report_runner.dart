import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_view.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/reports_repository.dart';
import 'package:usd_flutter_modules/native_integration/channel.dart';
import 'package:usd_flutter_modules/native_integration/setup.dart';

class ReportRunnerView extends StatefulWidget {
  final int reportId;

  const ReportRunnerView({Key key, this.reportId}) : super(key: key);

  @override
  _ReportRunnerViewState createState() => _ReportRunnerViewState();
}

class _ReportRunnerViewState extends State<ReportRunnerView> {
  ReportRunnerBloc _reportRunnerBloc;

  @override
  void initState() {
    super.initState();
    final _reportsRepository =
        RepositoryProvider.of<ReportsRepository>(context);
    _reportRunnerBloc = ReportRunnerBloc(reportsRepository: _reportsRepository)
      ..add(ReportRunnerGetReport(reportId: widget.reportId));
  }

  @override
  void dispose() {
    super.dispose();
    _reportRunnerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportRunnerBloc>(
      create: (context) => _reportRunnerBloc,
      child: BlocConsumer<ReportRunnerBloc, ReportRunnerState>(
        listenWhen: (previous, current) => current is ReportRunnerFetchSuccess,
        listener: (context, state) {
          locator<RoutingChannel>().updateNativeAppTitle(state.report.title);
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(40),
              child: SafeArea(
                child: ReportRunnerFormView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
