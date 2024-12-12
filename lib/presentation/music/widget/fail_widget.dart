import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailedWidget extends StatelessWidget {
  final MusicState state;
  const FailedWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.message ?? 'Oops ! Somethings wrong'),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {
              context.read<MusicBloc>().add(const FetchMusicEvent("a"));
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
