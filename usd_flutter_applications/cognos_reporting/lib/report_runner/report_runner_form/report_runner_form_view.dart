import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/academic_periods/academic_period_selector.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/course_identification/course_identification_selector.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_action_buttons.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_bloc.dart';

class ReportRunnerFormView extends StatefulWidget {
  @override
  ReportRunnerFormViewState createState() {
    return ReportRunnerFormViewState();
  }
}

class ReportRunnerFormViewState extends State<ReportRunnerFormView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReportRunnerBloc>(context)
      ..add(ReportRunnerGetAcademicPeriods());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportRunnerFormBloc>(
      create: (_) => ReportRunnerFormBloc(),
      child: BlocBuilder<ReportRunnerFormBloc, ReportRunnerFormState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AcademicPeriodSelector(),
                    if (state.academicPeriod.isNotEmpty) ...[
                      CourseIDSelector(),
                    ],
                  ],
                ),
                ReportRunnerFormActionButtons(),
              ],
            ),
          );
        },
      ),
    );
  }
}
