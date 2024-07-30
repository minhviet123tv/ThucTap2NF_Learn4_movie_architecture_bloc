import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_3_3_movie_architecture_bloc/bloc/movie_bloc.dart';
import 'package:learn_3_3_movie_architecture_bloc/bloc/movie_event.dart';
import 'package:learn_3_3_movie_architecture_bloc/bloc/movie_state.dart';
import 'package:learn_3_3_movie_architecture_bloc/models/movie_model.dart';

import '../repositories/repositories.dart';

// Home Page
class MovieHomePage extends StatelessWidget {
  var textStyle1 = const TextStyle(fontSize: 25, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    //I. Cung cấp Bloc với Repository (Kho dữ liệu) đã được khai báo trên widget tree
    return BlocProvider(
      create: (context) => MovieBloc(RepositoryProvider.of<ListMovieRepository>(context))
        ..add(GetMovieEvent(),), // Thêm event cho bloc luôn để sử dụng
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Call API Movie List", style: textStyle1,),
          backgroundColor: Colors.blue,
        ),

        //II. Sử dụng Bloc Widget cho UI
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (BuildContext context, MovieState state) {
            if (state is MovieLoading) {
              // Khi mới mở trang sẽ có trạng thái MovieLoading() do đã add event là GetMovieEvent()
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieLoaded) {
              List<Movie> listMovie = state.listMovie;
              return showListMovie(listMovie); // GridView list movie
            }

            if (state is MovieLoadError) {
              return Text(
                state.error,
                style: const TextStyle(fontSize: 20),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  // GridView list movie
  Widget showListMovie(List<Movie> listMovie) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        children: List.generate(
          listMovie.length,
          (index) {
            return Container(
              padding: index.isEven
                  ? const EdgeInsets.only(right: 1, bottom: 1, top: 1)
                  : const EdgeInsets.only(left: 1, bottom: 1, top: 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185${listMovie[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
