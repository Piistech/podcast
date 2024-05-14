import 'package:flutter/cupertino.dart';
import '../../../../core/shared/constants.dart';
import '../../../../core/shared/shared.dart';

class MorePage extends StatelessWidget {
  static const String path = '/more';
  static const String name = 'morePage';
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalMargin15,
            vertical: context.verticalMargin15,
          ),
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "More",
                style: TextStyles.title(context: context, color: theme.textPrimary).copyWith(fontSize: 24.sp),
              ),
            ),
            SizedBox(height: context.verticalMargin10),
            Text(
              "Other options".toUpperCase(),
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
            SizedBox(height: context.verticalMargin10),
            CardWidget(
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.notifications_active_outlined, color: theme.white),
                horizontalTitleGap: 8.w,
                title: Text(
                  "Notification",
                  style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                ),
                trailing: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(height: context.verticalMargin10),
            Text(
              "Follow us".toUpperCase(),
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
            SizedBox(height: context.verticalMargin10),
            CardWidget(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.facebook_outlined, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Facebook",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                  Divider(color: theme.textSecondary, height: 1.h, thickness: .5.h),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset("images/icons/instagram.png", width: 16.w, height: 16.h, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Instagram",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.verticalMargin10),
            Text(
              "App".toUpperCase(),
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
            SizedBox(height: context.verticalMargin10),
            CardWidget(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.info_outline, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "About app",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                  Divider(color: theme.textSecondary, height: 1.h, thickness: .5.h),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.star_rate_outlined, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Rate us",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                  Divider(color: theme.textSecondary, height: 1.h, thickness: .5.h),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.share_outlined, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Share App",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                  Divider(color: theme.textSecondary, height: 1.h, thickness: .5.h),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.lock_outline_rounded, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Privacy Policy",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                  Divider(color: theme.textSecondary, height: 1.h, thickness: .5.h),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.list_alt_rounded, color: theme.white),
                    horizontalTitleGap: 8.w,
                    title: Text(
                      "Terms & Condition",
                      style: TextStyles.body(context: context, color: theme.white).copyWith(height: 1.2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.verticalMargin25),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "App Version:",
                    style: TextStyles.title(context: context, color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                  SizedBox(width: context.horizontalMargin8),
                  Text(
                    appVersion,
                    style: TextStyles.title(context: context, color: theme.textPrimary).copyWith(height: 1.2),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final Widget child;
  const CardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalMargin10,
            vertical: context.verticalMargin10,
          ),
          decoration: BoxDecoration(
            color: theme.backgroundSecondary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: child,
        );
      },
    );
  }
}
