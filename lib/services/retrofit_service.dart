import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retfrofit_app/models/notes_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

part 'retrofit_service.g.dart';

bool isTester = true;

const String SERVER_DEVELOPMENT = "https://620a2b8192946600171c5837.mockapi.io";

// *** CLIENT *** //

@RestApi(baseUrl: SERVER_DEVELOPMENT)
abstract class RetrofitNetwork {
  factory RetrofitNetwork(Dio dio, {String baseUrl}) = _RetrofitNetwork;

  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  @GET("/notes")
  Future<List<Note>> getNotes();

  @GET("/notes/{id}")
  Future<Note> getNoteWithId(@Path("id") int id);

  @POST("/notes")
  @http.Headers(headers)
  Future<Note> createNote(@Body() Note note);

  @PUT("/notes/{id}")
  @http.Headers(headers)
  Future<Note> updateNote(@Path() String id, @Body() Note note);

  @DELETE("/notes/{id}")
  @http.Headers(headers)
  Future<void> deleteNote(@Path("id") int id);

  @POST('/store')
  @MultiPart()
  Future<dynamic> store({
    @Part() required String title,
    @Part() required int part,
    @Part() File? attach,
  });
}
