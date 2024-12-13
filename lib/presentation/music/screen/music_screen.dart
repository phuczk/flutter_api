import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:api_flutter/presentation/music/widget/artist_list.dart';
import 'package:api_flutter/presentation/music/widget/search_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/list_music.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MusicBloc>().add(const FetchMusicEvent("yes"));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(23, 23, 23, 0.09),
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            SearchInputWidget(),
            ListArtistWidget(),
            ListPostSectionWidget(),
          ],
        ),
      ),
    );
  }
}
