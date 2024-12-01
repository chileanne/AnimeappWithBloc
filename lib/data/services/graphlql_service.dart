
import 'package:animeapp/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'graphql_config.dart';

class GraphQlService {
  static GraohqlConfig graphQLConfig = GraohqlConfig();
  ValueNotifier<GraphQLClient> client = graphQLConfig.client;



  Future<Map<String, dynamic>?> getAnime() async {
    QueryResult queryResult = await client.value.query(QueryOptions(
      fetchPolicy: FetchPolicy.noCache,
      document: gql(getAnimeApi), // this is the query string you just created
    ));

    final result = queryResult;
    return result.data;
  }



}