import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class GraohqlConfig{
  static final HttpLink httpLink = HttpLink(
    'https://graphql.anilist.co',
  );





  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
    ),
  );
}