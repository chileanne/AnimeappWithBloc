class AnimeModel {
  final AnimeData? data;

  AnimeModel({
    this.data,
  });

  AnimeModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String,dynamic>?) != null ? AnimeData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'data' : data?.toJson()
  };
}

class AnimeData {
  final Page? page;

  AnimeData({
    this.page,
  });

  AnimeData.fromJson(Map<String, dynamic> json)
      : page = (json['Page'] as Map<String,dynamic>?) != null ? Page.fromJson(json['Page'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'Page' : page?.toJson()
  };
}

class Page {
  final List<Media>? media;

  Page({
    this.media,
  });

  Page.fromJson(Map<String, dynamic> json)
      : media = (json['media'] as List?)?.map((dynamic e) => Media.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'media' : media?.map((e) => e.toJson()).toList()
  };
}

class Media {
  final int? seasonYear;
  final List<String>? genres;
  final int? episodes;
  final CoverImage? coverImage;
  final String? siteUrl;
  final Title? title;
  final String? description;

  Media({
    this.seasonYear,
    this.genres,
    this.episodes,
    this.coverImage,
    this.siteUrl,
    this.title,
    this.description,
  });

  Media.fromJson(Map<String, dynamic> json)
      : seasonYear = json['seasonYear'] as int?,
        genres = (json['genres'] as List?)?.map((dynamic e) => e as String).toList(),
        episodes = json['episodes'] as int?,
        coverImage = (json['coverImage'] as Map<String,dynamic>?) != null ? CoverImage.fromJson(json['coverImage'] as Map<String,dynamic>) : null,
        siteUrl = json['siteUrl'] as String?,
        title = (json['title'] as Map<String,dynamic>?) != null ? Title.fromJson(json['title'] as Map<String,dynamic>) : null,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'seasonYear' : seasonYear,
    'genres' : genres,
    'episodes' : episodes,
    'coverImage' : coverImage?.toJson(),
    'siteUrl' : siteUrl,
    'title' : title?.toJson(),
    'description' : description
  };
}

class CoverImage {
  final String? extraLarge;

  CoverImage({
    this.extraLarge,
  });

  CoverImage.fromJson(Map<String, dynamic> json)
      : extraLarge = json['extraLarge'] as String?;

  Map<String, dynamic> toJson() => {
    'extraLarge' : extraLarge
  };
}

class Title {
  final String? english;
  final String? native;

  Title({
    this.english,
    this.native,
  });

  Title.fromJson(Map<String, dynamic> json)
      : english = json['english'] as String?,
        native = json['native'] as String?;

  Map<String, dynamic> toJson() => {
    'english' : english,
    'native' : native
  };
}