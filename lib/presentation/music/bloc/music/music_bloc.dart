import 'package:api_flutter/data/music/response/music_response.dart';
import 'package:api_flutter/domain/music/entity/music_entity.dart';
import 'package:api_flutter/domain/music/usecase/music_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../manager/enum/status_enum.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final MusicUsecase _musicUsecase;
  MusicBloc(this._musicUsecase) : super(const MusicState()) {
    on<FetchMusicEvent>(_fetchMusicEvent);
    on<SearchMusicEvent>(_searchMusicEvent);
  }

  Future<void> _fetchMusicEvent(FetchMusicEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _musicUsecase.fetchMusics(event.name);
      emit(state.copyWith(status: Status.success, musics: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
      print(e);
    }
  }

  Future<void> _searchMusicEvent(SearchMusicEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _musicUsecase.fetchMusics(event.name);
      emit(state.copyWith(status: Status.success, musics: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
      print(e);
    }
  }
}
