

 import 'package:animeapp/data/model/anime_model.dart';
import 'package:animeapp/data/repository/animeRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anime_event.dart';
  part 'anime_state.dart';


   class AnimeBloc extends Bloc<AnimeEvents,AnimeState>{

     final AnimeRepo animeRepo ;



     AnimeBloc(this.animeRepo):super(AnimeInitial()){
       on<getAnimeRequest>(_onGetAnimeRequest);
       on<buttonForward>(_onButtonForward);
       on<buttonBackward>(_onButtonBackward);
     }






     void _onGetAnimeRequest(getAnimeRequest event, Emitter<AnimeState> emit) async{
         emit(AnimeLoading());
         try{
          final animeData = await animeRepo.getAnimeData();
          emit(AnimeLoadSuccess(animeData: animeData));
         }catch(e){
            emit(AnimeLoadFailure(e.toString()));
         }
     }

     void _onButtonForward(buttonForward event, Emitter<AnimeState> emit) async{
       final controller = event.controller;
         controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.linear);
     }


     void _onButtonBackward(buttonBackward event, Emitter<AnimeState> emit) async{
       final controller = event.controller;
       controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.linear);
     }

   }