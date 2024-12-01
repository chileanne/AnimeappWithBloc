
import 'package:animeapp/data/model/anime_model.dart';

import '../services/graphlql_service.dart';

class AnimeRepo{


    final GraphQlService _sv =GraphQlService();


    Future<AnimeData> getAnimeData() async{
      try {
        final response = await _sv.getAnime();
        return AnimeData.fromJson(response!);
      } catch (e) {
        rethrow;
      }
    }

}