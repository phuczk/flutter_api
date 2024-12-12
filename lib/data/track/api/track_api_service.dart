import 'package:api_flutter/data/track/response/track_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part "track_api_service.g.dart";

@RestApi(baseUrl: "https://deezerdevs-deezer.p.rapidapi.com")
abstract class TrackApiService {
  factory TrackApiService(Dio dio) = _TrackApiService;

  @GET("/track/{id}")
  Future<TrackResponse> fetchMusics(
    @Path() String id,
    @Header("x-rapidapi-key") String apiKey,
    @Header("x-rapidapi-host") String apiHost,
  );
}
