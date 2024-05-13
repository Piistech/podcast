import 'shared.dart';

class TaskNotifier {
  static final TaskNotifier instance = TaskNotifier._private();

  TaskNotifier._private();

//------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void success(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 16,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
            title: Text(
              message,
              style: TextStyles.body(
                context: context,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 4,
          backgroundColor: Colors.greenAccent.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void error(BuildContext context, {required String message, bool fromBottomSheet = false}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: fromBottomSheet ? MediaQuery.of(context).viewInsets : EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 16,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.error_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextStyles.body(
                context: context,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 4,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void warning(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 16,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.warning_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextStyles.body(
                context: context,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 4,
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }

  void noInternet(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 16,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.signal_cellular_connected_no_internet_0_bar_rounded, color: Colors.white),
            title: Text(
              "No internet!!!",
              style: TextStyles.body(
                context: context,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 4,
          duration: const Duration(days: 365),
          backgroundColor: Colors.grey.shade900,
          dismissDirection: DismissDirection.none,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      );
  }

  void info(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: ListTile(
            dense: true,
            horizontalTitleGap: 16,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const Icon(Icons.tips_and_updates_rounded, color: Colors.white),
            title: Text(
              message,
              style: TextStyles.body(
                context: context,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 4,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
  }
}