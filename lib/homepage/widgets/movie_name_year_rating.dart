part of '../home_page.dart';

class MovieNameYearRating extends StatelessWidget {
  const MovieNameYearRating({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 357,
      child: Column(
        children: [
          HeadingSeeAll(title: title).setPadding(),
          const SizedBox(height: 10),
          MovieWidgets(movies: movies),
        ],
      ),
    );
  }
}

class MovieWidgets extends StatelessWidget {
  const MovieWidgets({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            width: 33,
          );
        },
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length + 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 25 : 0,
              right: index == movies.length ? 25 : 0,
            ),
            child: movies.length == index
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: KColors.onyx,
                      ),
                      child: Center(
                        child: Text(
                          'See all',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: KColors.mountbattenPink),
                        ),
                      ),
                    ),
                  )
                : MovieWidgetYrRating(movie: movies[index]),
          );
        },
      ),
    );
  }
}

class HeadingSeeAll extends StatelessWidget {
  const HeadingSeeAll({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline2),
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(),
          child: Text(
            'See all',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: KColors.royalPurple),
          ),
        ),
      ],
    );
  }
}

class MovieWidgetYrRating extends StatelessWidget {
  const MovieWidgetYrRating({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PopularMovieImage(movie: movie),
        NameYearRatingSection(movie: movie),
      ],
    );
  }
}

class NameYearRatingSection extends StatelessWidget {
  const NameYearRatingSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width * .4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopularMovieNameYear(movie: movie),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movie.rating.toString(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(width: 3),
              Icon(
                Icons.star_rate,
                color: Colors.yellow.shade500,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularMovieNameYear extends StatelessWidget {
  const PopularMovieNameYear({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.name,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 5),
        Text(
          movie.releaseYear,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}

class PopularMovieImage extends StatelessWidget {
  const PopularMovieImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MoviePage(movie: movie);
          },
        ));
      },
      child: Hero(
        tag: movie.id,
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
            color: KColors.onyx,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: KColors.royalPurple.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.image,
                fit: BoxFit.cover,
                height: 250,
                width: MediaQuery.of(context).size.width * .45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
