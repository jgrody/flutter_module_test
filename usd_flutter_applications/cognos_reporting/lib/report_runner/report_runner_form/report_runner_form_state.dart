part of 'report_runner_form_bloc.dart';

@immutable
class ReportRunnerFormState {
  final String academicPeriod;
  final Map<String, bool> availableCourseIDs;

  const ReportRunnerFormState({
    @required this.academicPeriod,
    @required this.availableCourseIDs,
  });

  List get selectedCourseIDs {
    final List list = List();
    for (final courseID in availableCourseIDs.entries) {
      if (courseID.value) {
        list.add(courseID.key);
      }
    }
    return list;
  }

  factory ReportRunnerFormState.initial() {
    return const ReportRunnerFormState(
      academicPeriod: '',
      availableCourseIDs: {},
    );
  }

  ReportRunnerFormState update({
    String academicPeriod,
    Map<String, bool> availableCourseIDs,
  }) {
    return ReportRunnerFormState(
      academicPeriod: academicPeriod ?? this.academicPeriod,
      availableCourseIDs: availableCourseIDs ?? this.availableCourseIDs,
    );
  }

  @override
  String toString() {
    return '''
      ReportRunnerFormState {
        availableCourseIDs: $availableCourseIDs,
      }
    ''';
  }
}
