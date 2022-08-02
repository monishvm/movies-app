import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/constants/kcolors.dart';
import 'package:movies_app/constants/paddingex.dart';
import 'package:movies_app/models/movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key, required this.movie, this.foru}) : super(key: key);

  final Movie movie;
  final String? foru;
  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool show = false;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    fullImage();
  }

  Future<void> fullImage() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (mounted) {
        setState(() {
          show = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: KColors.royalPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Watch now',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                MovieImageMoviePage(
                  movie: widget.movie,
                  show: show,
                  forU: widget.foru,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        KColors.eerieBlack,
                      ],
                      stops: [0, 0.6],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.movie.name,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.movie.releaseYear,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.movie.rating.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.yellow.shade500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: const [
                              CustomWidget(title: 'Epic'),
                              SizedBox(width: 10),
                              CustomWidget(title: 'Fantasy'),
                              SizedBox(width: 10),
                              CustomWidget(title: 'Drama'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'title csnk cj skj cjs kcj cke ckjcj sdcmn ccsdcnfv csjdc cdjcdk',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Cast',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ).setPadding(),
                      SizedBox(
                        height: 95,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 25 : 0,
                                  right: index == 5 - 1 ? 25 : 0),
                              height: 70,
                              width: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: KColors.mountbattenPink,
                                      boxShadow: [
                                        BoxShadow(
                                          color: KColors.royalPurple
                                              .withOpacity(0.2),
                                          blurRadius: 7,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://phantom-marca.unidadeditorial.es/9adb565dcfc4dc3e9b1948c7cf5b8f01/resize/1320/f/jpg/assets/multimedia/imagenes/2022/02/21/16454391499069.jpg',
                                        fit: BoxFit.cover,
                                        height: 70,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Actor',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 20);
                          },
                          itemCount: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: KColors.eerieBlack,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: KColors.onyx,
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: KColors.mountbattenPink),
        ),
      ),
    );
  }
}

class MovieImageMoviePage extends StatelessWidget {
  const MovieImageMoviePage({
    Key? key,
    required this.movie,
    required this.show,
    this.forU,
  }) : super(key: key);

  final Movie movie;
  final bool show;
  final String? forU;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Hero(
        tag: movie.id + (forU ?? ''),
        child: AnimatedContainer(
          height: show
              ? MediaQuery.of(context).size.height * .8
              : MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 200),
          child: Image.network(
            movie.image,
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
