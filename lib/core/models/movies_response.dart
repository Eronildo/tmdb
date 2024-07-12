import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb/core/models/movie.dart';

part 'movies_response.freezed.dart';
part 'movies_response.g.dart';

@freezed
class MoviesResponse with _$MoviesResponse {
  factory MoviesResponse({
    @Default([]) @JsonKey(name: 'results') List<Movie> movies,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}
