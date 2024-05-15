import '../shared.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => theme.primaryColor;

  Color get hintColor => theme.hintColor;

  Color get textColor => Colors.black;

  Color get secondaryColor => theme.cardColor;

  Color get backgroundColor => Colors.white;

  double get topInset => MediaQuery.of(this).padding.top;

  double get bottomInset => MediaQuery.of(this).padding.bottom;

  double get smallestSide => MediaQuery.of(this).size.shortestSide;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
  double get liveContainerHeight => MediaQuery.of(this).size.height * .78;
  double get liveImageHeight => MediaQuery.of(this).size.height * .65;

  ScaffoldMessengerState successNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.textPrimary),
      ),
      backgroundColor: theme.positive,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ScaffoldMessengerState errorNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.textPrimary),
      ),
      backgroundColor: theme.negative,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ScaffoldMessengerState warningNotification({
    required String message,
  }) {
    final theme = themeBloc.state.scheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyles.body(context: this, color: theme.backgroundPrimary),
      ),
      backgroundColor: theme.warning,
    );
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  ThemeBloc get themeBloc => this.read<ThemeBloc>();

  TextStyle textStyle20Medium({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
  TextStyle textStyle24Medium({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
  TextStyle textStyle17Medium({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
  TextStyle textStyle17Regular({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      );

  TextStyle textStyle12Medium({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
  TextStyle textStyle14Medium({required Color color}) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );

  TextStyle textStyle10Regular({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: color,
        ),
      );
  TextStyle textStyle10Medium({required Color color}) => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );

  double get radius2 => 2.r;
  double get radius4 => 4.r;
  double get radius5 => 5.r;
  double get radius8 => 8.r;
  double get radius10 => 10.r;
  double get radius12 => 12.r;
  double get radius16 => 16.r;
  double get radius52 => 52.r;

  double get horizontalMargin1 => 1.w;
  double get horizontalMargin2 => 2.w;
  double get horizontalMargin4 => 4.w;
  double get horizontalMargin6 => 6.w;
  double get horizontalMargin8 => 8.w;
  double get horizontalMargin10 => 10.w;
  double get horizontalMargin12 => 12.w;
  double get horizontalMargin15 => 15.w;
  double get horizontalMargin16 => 16.w;
  double get horizontalMargin19 => 19.w;
  double get horizontalMargin20 => 20.w;
  double get horizontalMargin30 => 30.w;

  double get verticalMargin4 => 4.h;
  double get verticalMargin5 => 5.h;
  double get verticalMargin6 => 6.h;
  double get verticalMargin8 => 8.h;
  double get verticalMargin10 => 10.h;
  double get verticalMargin11 => 11.h;
  double get verticalMargin12 => 12.h;
  double get verticalMargin14 => 14.h;
  double get verticalMargin15 => 15.h;
  double get verticalMargin16 => 16.h;
  double get verticalMargin20 => 20.h;
  double get verticalMargin25 => 25.h;
  double get verticalMargin40 => 40.h;

  double get flagHeight24 => 24.h;
  double get navBarHeight => 54.h;
}
