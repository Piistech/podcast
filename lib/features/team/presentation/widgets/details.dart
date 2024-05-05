import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast/features/team/presentation/bloc/team_bloc.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamDetailsWidget extends StatelessWidget {
  const TeamDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) {
        if (state is TeamLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TeamDone) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.team.name.substring(0, 3),
                style: TextStyles.caption(context: context, color: context.textColor).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              CachedNetworkImage(
                imageUrl: state.team.flag,
                width: 24,
                height: 24,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
