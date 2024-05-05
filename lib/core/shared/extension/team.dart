import '../../../features/team/team.dart';

extension TeamEntityExtension on TeamEntity {
  String get shortName {
    return name.split(" ").length > 1
        ? name.split(" ").map((e) => e.substring(0, 1).toUpperCase()).join()
        : name.substring(0, 3).toUpperCase();
  }
}
