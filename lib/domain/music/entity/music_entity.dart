import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MusicEntity extends Equatable {
  final int? id;
  final String? title;
  final int? rank;
  final String? preview;

  const MusicEntity(this.rank, this.preview, this.id, this.title);

  @override
  List<Object?> get props => [id, title, rank, preview];
}
