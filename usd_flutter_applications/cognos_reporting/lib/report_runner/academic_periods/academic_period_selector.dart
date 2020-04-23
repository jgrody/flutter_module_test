import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_bloc.dart';
import 'package:usd_flutter_modules/ui/progress_indicators/circular_progress_indicator.dart';

import 'constants.dart';

class AcademicPeriodSelector extends StatefulWidget {
  @override
  _AcademicPeriodSelectorState createState() => _AcademicPeriodSelectorState();
}

class _AcademicPeriodSelectorState extends State<AcademicPeriodSelector> {
  ReportRunnerBloc _reportRunnerBloc;
  ReportRunnerFormBloc _reportRunnerFormBloc;
  String _currentValue;
  List<DropdownMenuItem<dynamic>> _items = [];
  DropdownMenuItem _initialValue;

  @override
  void initState() {
    super.initState();
    _reportRunnerBloc = BlocProvider.of<ReportRunnerBloc>(context);
    _reportRunnerFormBloc = BlocProvider.of<ReportRunnerFormBloc>(context);
    _currentValue = _reportRunnerFormBloc.state.academicPeriod;
    _initialValue = DropdownMenuItem(
        value: _currentValue, child: Text('Please select a term'));
    _items.add(_initialValue);
  }

  @override
  void dispose() {
    super.dispose();
    _reportRunnerBloc.close();
    _reportRunnerFormBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            academicPeriodSelectorLabel,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          BlocConsumer<ReportRunnerBloc, ReportRunnerState>(
              bloc: _reportRunnerBloc,
              listenWhen: (previous, current) =>
                  current is ReportRunnerGetAcademicPeriodsSuccess,
              listener: (context, state) {
                final _state = state as ReportRunnerGetAcademicPeriodsSuccess;
                for (final period in _state.periods) {
                  _items.add(DropdownMenuItem(
                    child: Text(period.term),
                    value: period.term,
                  ));
                }
              },
              buildWhen: (previous, current) {
                return (current is ReportRunnerGetAcademicPeriodsSuccess ||
                    current is ReportRunnerGetAcademicPeriodsFailure ||
                    current is ReportRunnerFetchingAcademicPeriods);
              },
              builder: (context, state) {
                if (state is ReportRunnerGetAcademicPeriodsSuccess) {
                  return DropdownButton(
                    value: _currentValue,
                    items: _items,
                    onChanged: (value) {
                      BlocProvider.of<ReportRunnerBloc>(context)
                        ..add(ReportRunnerGetCourseIDRecords(value));
                      BlocProvider.of<ReportRunnerFormBloc>(context)
                        ..add(ReportRunnerFormSelectAcademicPeriod(value));
                      setState(() => _currentValue = value);
                    },
                  );
                } else if (state is ReportRunnerGetAcademicPeriodsFailure) {
                  return Text('Failed to load');
                } else {
                  return Center(
                    child: USDCircularIndicator(
                      size: USDCircularIndicatorSize.Small,
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
