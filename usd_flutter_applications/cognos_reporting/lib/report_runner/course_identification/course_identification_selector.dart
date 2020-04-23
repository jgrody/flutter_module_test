import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/report_runner/report_runner_form/report_runner_form_bloc.dart';
import 'package:usd_flutter_modules/ui/custom_checkbox/custom_checkbox.dart';
import 'package:usd_flutter_modules/ui/progress_indicators/circular_progress_indicator.dart';

import 'constants.dart';

class CourseIDSelector extends StatefulWidget {
  @override
  _CourseIDSelectorState createState() => _CourseIDSelectorState();
}

class _CourseIDSelectorState extends State<CourseIDSelector> {
  ReportRunnerBloc _reportRunnerBloc;
  ReportRunnerFormBloc _reportRunnerFormBloc;

  double _courseIDSelectionBoxHeight;
  double _courseIDCheckboxHeight;
  bool _allSelected = false;

  @override
  void initState() {
    super.initState();
    _reportRunnerFormBloc = BlocProvider.of<ReportRunnerFormBloc>(context);

    _reportRunnerBloc = BlocProvider.of<ReportRunnerBloc>(context)
      ..add(ReportRunnerGetCourseIDRecords(
          _reportRunnerFormBloc.state.academicPeriod));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    _courseIDSelectionBoxHeight = _mediaQueryData.size.height / 4;
    _courseIDCheckboxHeight = _courseIDSelectionBoxHeight / 4;
  }

  @override
  void dispose() {
    super.dispose();
    _reportRunnerBloc.close();
    _reportRunnerFormBloc.close();
  }

  void _reportRunnerBlocListener(
    BuildContext context,
    ReportRunnerState state,
  ) {
    print('LISTENER');
    // Set all course ID options values to false by default
    // This gives them an initial value and displays the checkboxes deselected
    // Allows UI to load properly so there are no null values
    if (state is ReportRunnerGetCourseIDRecordsSuccess) {
      _deselectAll(state);
    }
  }

  void _selectAll(ReportRunnerGetCourseIDRecordsSuccess state) {
    for (final courseID in state.courseIDs) {
      _toggleCourseID(courseID.name, true);
      setState(() => _allSelected = true);
    }
  }

  void _deselectAll(ReportRunnerGetCourseIDRecordsSuccess state) {
    for (final courseID in state.courseIDs) {
      _toggleCourseID(courseID.name, false);
      setState(() => _allSelected = false);
    }
  }

  // Toggle an individual courseID selection
  void _toggleCourseID(
    String courseIDName,
    bool value,
  ) {
    _reportRunnerFormBloc.add(
      ReportRunnerFormToggleCourseId(
        courseIDName,
        value,
      ),
    );
  }

  Widget _courseIDSelectionBox(ReportRunnerGetCourseIDRecordsSuccess state) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _courseIDSelectionBoxHeight,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListView.separated(
          itemCount: state.courseIDs.length,
          separatorBuilder: (_, index) => Divider(),
          itemBuilder: (context, index) {
            final courseIDName = state.courseIDs[index].name;

            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: _courseIDCheckboxHeight,
              ),
              child: USDCheckbox(
                label: courseIDName,
                value: _reportRunnerFormBloc
                    .state.availableCourseIDs[courseIDName],
                onChanged: (bool value) => _toggleCourseID(courseIDName, value),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _courseIdSelectAllToggle(ReportRunnerGetCourseIDRecordsSuccess state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text(
            _allSelected ? deselectAllText : selectAllText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () =>
              _allSelected ? _deselectAll(state) : _selectAll(state),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportRunnerBloc, ReportRunnerState>(
      listener: _reportRunnerBlocListener,
      builder: (context, state) {
        if (state is ReportRunnerGetCourseIDRecordsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                courseIDSelectorLabel,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              _courseIDSelectionBox(state),
              _courseIdSelectAllToggle(state),
            ],
          );
        } else if (state is ReportRunnerGetCourseIDRecordsFailure) {
          return Text('Failed to load');
        } else {
          return Center(
            child: USDCircularIndicator(
              size: USDCircularIndicatorSize.Small,
            ),
          );
        }
      },
    );
  }
}
