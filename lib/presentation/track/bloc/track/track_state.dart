part of 'track_bloc.dart';

sealed class TrackState extends Equatable {
  const TrackState();
  
  @override
  List<Object> get props => [];
}

final class TrackInitial extends TrackState {}
