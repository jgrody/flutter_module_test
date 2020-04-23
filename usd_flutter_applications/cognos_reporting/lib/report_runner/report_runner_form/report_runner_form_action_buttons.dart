import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/routing/routes.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/services/navigator.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/theme.dart';
import 'package:usd_flutter_modules/native_integration/setup.dart';

class ReportRunnerFormActionButtons extends StatelessWidget {
  void _runReport() {}

  void _cancel() => locator<NavigatorService>().navigateTo(Routes.dashboard);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportRunnerBloc, ReportRunnerState>(
      builder: (context, reportRunnerState) {
        return BlocBuilder<ReportRunnerFormBloc, ReportRunnerFormState>(
          builder: (context, reportRunnerFormState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: gray,
                    child: Text('Cancel'),
                    onPressed: _cancel,
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: RaisedButton(
                    textTheme: ButtonTextTheme.primary,
                    child: Text(
                      'Finish',
                    ),
                    onPressed:
                        reportRunnerFormState.selectedCourseIDs.isNotEmpty
                            ? () {}
                            : null,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
