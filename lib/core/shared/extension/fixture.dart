import 'package:intl/intl.dart';

import '../../../features/fixture/fixture.dart';

extension FixtureEntityExtension on FixtureEntity {
  String get title {
    return '$matchTitle, $matchDescription';
  }

  bool get isLive {
    return (result != "" && isCompleted==false && (startedAt.isAfter(DateTime.now())|| startedAt.isAtSameMomentAs(DateTime.now()))) ? false : DateTime.now().isAfter(startedAt);
  }

  bool get isUpcoming {
    return !isLive && DateTime.now().isBefore(startedAt);
  }

  bool get isFinished {
    return !isLive && !isUpcoming && (result != "" || result!=null) && isCompleted;
  }

  String get startTime {
    return 'Starts at ${DateFormat("h:mm a").format(startedAt)}';
  }

  String get startDate {
    return DateFormat("dd MMMM yyyy, EEEE").format(startedAt);
  }
}
