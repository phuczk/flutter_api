import 'package:api_flutter/core/constant/api_app.dart';
import 'package:api_flutter/data/track/response/track_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part "track_api_service.g.dart";

@RestApi(baseUrl: baseUrl)
abstract class TrackApiService {
  factory TrackApiService(Dio dio) = _TrackApiService;

  @GET("/track/{id}")
  Future<TrackResponse> getTrack(
    @Path() String id,
    @Header("x-rapidapi-key") String apiKey,
    @Header("x-rapidapi-host") String apiHost,
  );
}
