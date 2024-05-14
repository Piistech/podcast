import 'package:podcast/features/live_audio/presentation/widgets/shimmer/item.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../commentary/commentary.dart';
import '../../fixture.dart';

class FixturesPage extends StatefulWidget {
  static const String path = '/fixtures';
  static const String name = 'FixturesPage';

  const FixturesPage({super.key});

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
          onRefresh: () async {
            context.read<FixturesBloc>().add(const FetchFixtures());
          },
          child: BlocBuilder<FixturesBloc, FixturesState>(
            builder: (_, state) {
              if (state is FixturesLoading) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, __) => const ShimmerItem(),
                );
              } else if (state is FixturesDone) {
                return ListView.separated(
                  itemCount: state.fixtures.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontalMargin15,
                    vertical: context.verticalMargin15,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: context.verticalMargin8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final fixture = state.fixtures[index];
                    return BlocProvider(
                      create: (context) => sl<CommentaryBloc>()
                        ..add(
                          FetchCommentary(fixtureGuid: fixture.guid),
                        ),
                      child: FixtureItemWidget(fixture: fixture),
                    );
                  },
                );
              } else if (state is FixturesError) {
                return Center(child: Text(state.failure.message));
              } else {
                return Container();
              }
            },
          ),
        );    
  }
}
