//I. Model của API từ trang api.themoviedb.org
class MovieData {
  // Các dữ liệu theo key sẽ lấy về từ file Json (API)
  late int _page;
  late int _totalResults;
  late int _totalPages;
  late List<Movie> _listMovie = [];

  // Thực hiện lấy dữ liệu cho _listMovie
  MovieData.fromMyJson(Map<String, dynamic> json) {
    // print(json['results'].length); // Số lượng item có trong results
    _page = json['page'];
    _totalResults = json['total_results'];
    _totalPages = json['total_pages'];
    List<Movie> tempListMovie = [];

    // Lấy các dữ liệu (chính) trong results của API vào danh sách
    for (int i = 0; i < json['results'].length; i++) {
      Movie movie = Movie(json['results'][i]);
      tempListMovie.add(movie);
    }
    _listMovie = tempListMovie;
  }

  List<Movie> get listMovie => _listMovie;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

//II. Model dữ liệu của 1 movie (là đối tượng trong key 'result' của API)
class Movie {
  late int _voteCount;
  late int _id;
  late bool _video;
  late double _voteAverage;
  late String _title;
  late double _popularity;
  late String _posterPath;
  late String _originalLanguage;
  late String _originalTitle;
  late final List<int> _genreIds = [];
  late String _backdropPath;
  late bool _adult;
  late String _overview;
  late String _releaseDate;

  // Tạo 1 Movie từ dữ liệu (json) cho trước
  Movie(Map<String, dynamic> result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
