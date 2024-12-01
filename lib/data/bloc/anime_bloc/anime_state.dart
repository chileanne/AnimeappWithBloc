part of 'anime_bloc.dart';

sealed class AnimeState{}

///representing the intial state
 final class AnimeInitial extends AnimeState{}

final class AnimeLoadSuccess extends AnimeState{
 final AnimeData animeData;

   AnimeLoadSuccess({required this.animeData});
}

final class AnimeLoadFailure extends AnimeState{
 final String error;

  AnimeLoadFailure(this.error);

}


final class AnimeLoading extends AnimeState{}
