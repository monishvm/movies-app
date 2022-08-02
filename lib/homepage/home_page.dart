import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/constants/genres.dart';
import 'package:movies_app/constants/kcolors.dart';
import 'package:movies_app/constants/movies.dart';
import 'package:movies_app/constants/paddingex.dart';
import 'package:movies_app/constants/populars.dart';
import 'package:movies_app/models/genre.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/moviepage/movie_page.dart';
import 'package:provider/provider.dart';

part './widgets/for_you_section.dart';
part './widgets/genres_section.dart';
part 'widgets/movie_name_year_rating.dart';

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller,
      [double height = 100]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GradientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        const NameAndProfilePic().setPadding(),
                        const SizedBox(height: 35),
                        const SearchField().setPadding(),
                        const SizedBox(height: 35),
                        ForYouSection(movies: movies.reversed.toList()),
                        const SizedBox(height: 35),
                        MovieNameYearRating(title: 'Popular', movies: movies),
                        const SizedBox(height: 35),
                        GenresSection(genres: genres),
                        const SizedBox(height: 35),
                        MovieNameYearRating(
                          title: 'Leagendary Movies',
                          movies: popularMovies.reversed.toList(),
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),
              ),
              const ScrollToHide(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollToHide extends StatelessWidget {
  const ScrollToHide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 15,
      left: 15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.home_rounded, size: 35),
                Icon(Icons.explore_rounded, size: 35),
                Icon(Icons.video_camera_front_rounded, size: 35),
                Icon(Icons.person_rounded, size: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameAndProfilePic extends StatelessWidget {
  const NameAndProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hi, Melanie!',
          style: Theme.of(context).textTheme.headline3,
        ),
        const ProfileCircle(),
      ],
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            KColors.eerieBlack,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: KColors.mountbattenPink,
      style: Theme.of(context).textTheme.bodyText1,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: KColors.mountbattenPink,
            ),
        filled: true,
        fillColor: KColors.onyx,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: KColors.mountbattenPink,
            width: 0.7,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: KColors.mountbattenPink,
        ),
      ),
    );
  }
}

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            radius: 25,
            child: Center(
              child: Image.network(
                'https://i.pinimg.com/236x/4e/9f/03/4e9f035d05faeb0561835197a51a51f5.jpg',
                fit: BoxFit.fill,
                height: 25 * 2,
                width: 25 * 2,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                color: KColors.royalPurple,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
