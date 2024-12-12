part of 'music_bloc.dart';

class MusicState extends Equatable {
  final List<MusicResponse>? musics;
  final MusicEntity? musicEntity;
  final Status? status;
  final String? message;
  final String? id;

  const MusicState({
    this.message,
    this.status = Status.initial,
    this.musicEntity,
    this.musics = const [],
    this.id,
  });

  @override
  List<Object?> get props => [message, status, musicEntity, musics, id];

  MusicState copyWith({
    List<MusicResponse>? musics,
    MusicEntity? musicEntity,
    String? id,
    Status? status,
    String? message,
  }) {
    return MusicState(
      message: message ?? this.message,
      status: status ?? this.status,
      musicEntity: musicEntity ?? this.musicEntity,
      musics: musics ?? this.musics,
      id: id ?? this.id,
    );
  }
}
