part of '../home_page.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({Key? key, required this.genres}) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          const HeadingSeeAll(title: 'Genres').setPadding(),
          const SizedBox(height: 10),
          GenresMovieWidgets(genres: genres),
        ],
      ),
    );
  }
}

class GenresMovieWidgets extends StatelessWidget {
  const GenresMovieWidgets({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(width: 33),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length + 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 25 : 0,
              right: index == genres.length ? 25 : 0,
            ),
            child: genres.length == index
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.7,
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
                : GenresMovieWidget(genre: genres[index]),
          );
        },
      ),
    );
  }
}

class GenresMovieWidget extends StatelessWidget {
  const GenresMovieWidget({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: KColors.onyx,
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
                genre.image,
                height: 190,
                width: MediaQuery.of(context).size.width * .7,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            genre.name,
            style: Theme.of(context).textTheme.headline1,
          ),
        )
      ],
    );
  }
}
