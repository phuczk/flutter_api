import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:api_flutter/presentation/music/widget/fail_widget.dart';
import 'package:api_flutter/presentation/music/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/enum/status_enum.dart';

class ListPostSectionWidget extends StatelessWidget {
  const ListPostSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<MusicBloc, MusicState>(
        listener: (context, state) {
          if (state.status == Status.failed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message ?? '')));
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const LoadingWidget();
          } else if (state.status == Status.failed) {
            return FailedWidget(state: state);
          } else if (state.status == Status.success) {
            final listPost = state.musics ?? [];
            return ListView.builder(
              itemCount: listPost.length,
              itemBuilder: (context, index) {
                final postItem = listPost[index];
                return Card(
                    elevation: 0.0,
                    color: const Color(0xFF17171717),
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        onTap: () {},
                        leading: postItem.album?.cover != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  postItem.album?.cover ?? '',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const CircleAvatar(child: Icon(Icons.music_note)),
                        title: Text(postItem.title ?? "Not Found",
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(
                          postItem.rank.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 129, 129, 129)),
                        ),
                        trailing: const Icon(Icons.play_arrow),
                      ),
                    ));
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
