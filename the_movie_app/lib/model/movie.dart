
class Movie{

  final String title;
  final String overview;
  final String poster_path;
  final String backdrop_path;
  final String vote_average;
  final int id;

  Movie({
   required this.title,
   required this.overview,
   required this.poster_path,
   required this.backdrop_path,
   required this.vote_average,
   required this.id
});

  factory Movie.fromJson(Map<String,dynamic> json){
    return Movie(
    title: json['title'],
    overview: json['overview'],
    poster_path: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
    backdrop_path: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
    vote_average: json['vote_average'].toString(),
    id: json['id']
    );
  }
}