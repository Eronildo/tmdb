
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_cast.freezed.dart';
part 'movie_cast.g.dart';

@freezed
class MovieCast with _$MovieCast {
  factory MovieCast({
    @Default('') String name,
    @Default('') @JsonKey(name: 'profile_path') String profilePath,
    @Default('') String character,
  }) = _MovieCast;
	
  factory MovieCast.fromJson(Map<String, dynamic> json) =>
			_$MovieCastFromJson(json);
}
