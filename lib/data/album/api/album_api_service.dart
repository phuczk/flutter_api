import 'package:api_flutter/core/constant/api_app.dart';
import 'package:api_flutter/data/album/response/music_album_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part "album_api_service.g.dart";

@RestApi(baseUrl: baseUrl)
abstract class AlbumApiService {
  factory AlbumApiService(Dio dio) = _AlbumApiService;

  @GET("/album/{id}")
  Future<MusicAlbumResponse> fetchAlbums(
    @Path() String id,
    @Header("x-rapidapi-key") String apiKey,
    @Header("x-rapidapi-host") String apiHost,
  );
}
