import 'package:equatable/equatable.dart';

import '../models/movie_model.dart';

sealed class MovieState extends Equatable{}

class MovieLoading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoaded extends MovieState {
  final List<Movie> listMovie;

  MovieLoaded(this.listMovie);

  @override
  List<Object?> get props => [listMovie];
}

class MovieLoadError extends MovieState {
  final String error;

  MovieLoadError(this.error);

  @override
  List<Object?> get props => [error];

}