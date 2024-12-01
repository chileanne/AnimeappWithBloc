

 part of 'anime_bloc.dart';

  sealed class AnimeEvents{}

  final class getAnimeRequest extends AnimeEvents{}


  final class buttonForward extends AnimeEvents{
   final PageController controller;

    buttonForward({required this.controller});
  }

  final class buttonBackward extends AnimeEvents{
   final PageController controller;

   buttonBackward({required this.controller});
  }