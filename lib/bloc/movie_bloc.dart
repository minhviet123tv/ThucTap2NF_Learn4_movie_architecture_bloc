import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../models/movie_model.dart';
import '../repositories/repositories.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ListMovieRepository _listMovieRepository;

  MovieBloc(this._listMovieRepository) : super(MovieLoading()){

    // Thực hiện khi cần lấy danh sách movie: sự kiện GetMovieEvent
    on<GetMovieEvent>((event, emit) async {
      emit(MovieLoading()); // Trạng thái là loading

      // Thực hiện lấy và truyền danh sách vào MovieState
      try {
        List<Movie> listMovie = await _listMovieRepository.getListMovie();
        emit(MovieLoaded(listMovie)); // Cập nhật trạng thái và truyền danh sách cho trạng thái
      } catch (e) {
        emit(MovieLoadError(e.toString())); // Cập nhật trạng thái và truyền String báo lỗi cho trạng thái
      }
    },);
  }

}