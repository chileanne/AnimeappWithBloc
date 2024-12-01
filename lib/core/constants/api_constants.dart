
/// query Strings
String getAnimeApi = """
 query getAnime{
Page {
    media {
      seasonYear
       genres
       episodes
       coverImage {
        extraLarge

       }
      siteUrl
      title {
        english
        native
      }
      description
    }
  }
}
""";