import 'package:equatable/equatable.dart';

sealed class MovieEvent extends Equatable {}
class GetMovieEvent extends MovieEvent {
  @override
  List<Object?> get props => [];
}