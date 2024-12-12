part of 'music_bloc.dart';

sealed class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class FetchMusicEvent extends MusicEvent {
  final String name;
  const FetchMusicEvent(this.name);

  @override
  List<Object> get props => [name];
}

class SearchMusicEvent extends MusicEvent {
  final String name;
  const SearchMusicEvent(this.name);

  @override
  List<Object> get props => [name];
}
