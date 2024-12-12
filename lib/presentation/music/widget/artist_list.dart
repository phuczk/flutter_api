import 'package:api_flutter/manager/enum/status_enum.dart';
import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:api_flutter/presentation/music/widget/fail_widget.dart';
import 'package:api_flutter/presentation/music/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListArtistWidget extends StatelessWidget {
  const ListArtistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
              scrollDirection: Axis.horizontal,
              itemCount: listPost.length,
              itemBuilder: (context, index) {
                final postItem = listPost[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Card(
                    elevation: 2.0,
                    color: Color(0xFF171717),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        postItem.album?.cover != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  postItem.album?.cover ?? '',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 100,
                                child: Icon(Icons.music_note),
                              ),
                        const SizedBox(height: 8),
                        Text(
                          postItem.title ?? "Not Found",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
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
