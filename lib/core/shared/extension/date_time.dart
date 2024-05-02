extension DateTimeExtension on DateTime {
  String get duration {
    final DateTime now = DateTime.now();

    final Duration diff = now.difference(this);

    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} second${diff.inSeconds > 1 ? "s" : ""} ago";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minute${diff.inMinutes > 1 ? "s" : ""} ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour${diff.inHours > 1 ? "s" : ""} ago";
    } else if (diff.inDays < 30) {
      return "${diff.inDays} day${diff.inDays > 1 ? "s" : ""} ago";
    } else if (diff.inDays < 365) {
      return "${diff.inDays ~/ 30} month${(diff.inDays ~/ 30) > 1 ? "s" : ""} ago";
    } else {
      return "${diff.inDays ~/ 365} year${(diff.inDays ~/ 365) > 1 ? "s" : ""} ago";
    }
  }
}
