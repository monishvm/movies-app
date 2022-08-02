part of '../home_page.dart';

class ForYouNotifier with ChangeNotifier {
  late PageController _controller;

  static int totalPages = movies.length;

  ForYouNotifier(PageController controller) {
    _controller = controller;

    _controller.addListener(() {
      notifyListeners();
    });
  }

  int get page => _controller.page == null ? 0 : _controller.page!.round();
}

class ForYouSection extends StatefulWidget {
  const ForYouSection({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  State<ForYouSection> createState() => _ForYouSectionState();
}

class _ForYouSectionState extends State<ForYouSection> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForYouNotifier(_pageController),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'For you',
              style: Theme.of(context).textTheme.headline2,
            ),
          ).setPadding(),
          const SizedBox(height: 10),
          ForYouMovies(movies: widget.movies),
          const SizedBox(height: 10),
          const Center(child: ForYouPageIndicator()),
        ],
      ),
    );
  }
}

class ForYouPageIndicator extends StatelessWidget {
  const ForYouPageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForYouNotifier>(
      builder: (context, notifier, child) {
        return Container(
          height: 25,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: KColors.onyx,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              ForYouNotifier.totalPages,
              (index) => Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: index == ForYouNotifier.totalPages - 1 ? 5 : 0,
                ),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: index == notifier.page
                      ? KColors.mountbattenPink
                      : KColors.mountbattenPink.withOpacity(0.2),
                ),
              ),
            ).toList(),
          ),
        );
      },
    );
  }
}

class ForYouMovies extends StatelessWidget {
  const ForYouMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    ForYouNotifier notifier = Provider.of<ForYouNotifier>(context);
    return SizedBox(
      height: 430,
      child: PageView.builder(
        controller: notifier._controller,
        physics: const BouncingScrollPhysics(),
        itemCount: ForYouNotifier.totalPages,
        itemBuilder: (context, index) {
          return ForYouMovieWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}

class ForYouMovieWidget extends StatelessWidget {
  const ForYouMovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MoviePage(movie: movie, foru: 'foru');
              },
            ));
          },
          child: Hero(
            tag: '${movie.id}foru',
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.85,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.image,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
