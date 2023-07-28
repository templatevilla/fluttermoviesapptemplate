import 'package:flutter/cupertino.dart';
import 'package:movie_app/utils/routs/routs_name.dart';

import 'package:movie_app/view/botoom%20bar/bottom_bar.dart';
import 'package:movie_app/view/home%20screen/home_screen.dart';
import 'package:movie_app/view/home%20screen/streaming_Model.dart';

import '../../view/movie details/movie_details_screen.dart';


class AppRouts{
  static Map<String,WidgetBuilder>routs={
    RoutesPath.bottomBar:(context) => const BottomBar(),
    RoutesPath.homeScreen:(context) => const HomeScreen(),
     RoutesPath.movieDetailsScreen:(context) =>  MovieDetailsScreen(model:StreamingModel()),

  };
}