import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    @Default(0) int id,
    @Default('') String title,
    @Default('') @JsonKey(name: 'poster_path') String posterPath,
    @Default('') @JsonKey(name: 'backdrop_path') String backdropPath,
    @Default('') String overview,
    @Default('') @JsonKey(name: 'release_date') String releaseDate,
    @Default(0.0) @JsonKey(name: 'vote_average') double voteAverage,
    @Default([]) @JsonKey(name: 'genre_ids') List<int> genreIds,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  factory Movie.empty() => Movie(
        id: 0,
        title: '',
        posterPath: '',
        backdropPath: '',
        overview: '',
        releaseDate: '',
        voteAverage: 0.0,
      );
}
