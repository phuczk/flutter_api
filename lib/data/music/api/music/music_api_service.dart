import 'package:api_flutter/data/music/response/music_api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part "music_api_service.g.dart";

@RestApi(baseUrl: "https://deezerdevs-deezer.p.rapidapi.com")
abstract class MusicApiService {
  factory MusicApiService(Dio dio) = _MusicApiService;

  @GET("/search")
  Future<MusicApiResponse> fetchMusics(
    @Query("q") String name,
    @Header("x-rapidapi-key") String apiKey,
    @Header("x-rapidapi-host") String apiHost,
  );

  @GET("/search")
  Future<MusicApiResponse> searchMusics(
    @Query("q") String name,
    @Header("x-rapidapi-key") String apiKey,
    @Header("x-rapidapi-host") String apiHost,
  );
}
