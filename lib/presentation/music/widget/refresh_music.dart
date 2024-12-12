import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshButtonWidget extends StatelessWidget {
  final String name;
  const RefreshButtonWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        context.read<MusicBloc>().add(FetchMusicEvent(name));
      },
    );
  }
}
