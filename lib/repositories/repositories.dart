import 'dart:convert';
import 'package:http/http.dart';

import '../models/movie_model.dart';

// Cung cấp phương thức lấy dữ liệu của API
class ListMovieRepository {
  final _apiKey = 'fdc7e0e8c8e8ada6263aa975d19e191b'; // your_api_key

  // Hàm thực hiện lấy dữ liệu từ API, trả về 1 model là MovieData
  Future<List<Movie>> getListMovie() async {
    Response response = await get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));

    if (response.statusCode == 200) {
      // Nếu cuộc gọi đến máy chủ thành công, Thực hiện lấy dữ liệu cho list
      MovieData movieData = MovieData.fromMyJson(jsonDecode(response.body));
      return movieData.listMovie;
    } else {
      // Nếu cuộc gọi đó không thành công, báo lỗi.
      throw Exception('Failed to load API');
    }
  }
}