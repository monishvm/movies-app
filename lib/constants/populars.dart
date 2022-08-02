import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/movie.dart';

List<Movie> popularMovies = [
  cruella,
  dune,
  shangChi,
];

Movie cruella = Movie(
  id: UniqueKey().toString(),
  name: 'Cruella',
  rating: 4.5,
  image: 'https://images7.alphacoders.com/117/1174497.jpg',
  releaseYear: '2021',
);
Movie dune = Movie(
  id: UniqueKey().toString(),
  name: 'Dune',
  rating: 4.2,
  image:
      "https://w0.peakpx.com/wallpaper/991/757/HD-wallpaper-dune-2021-sand-samsung-movie-note-10-timothee-chalamet-skies-sun-space-zendaya.jpg",
  releaseYear: '2021',
);
Movie shangChi = Movie(
  id: UniqueKey().toString(),
  name: 'Shang Chi',
  rating: 4.8,
  image: 'https://wallpapercave.com/dwp1x/wp9324412.jpg',
  releaseYear: '2021',
);
