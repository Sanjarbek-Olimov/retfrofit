// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RetrofitNetwork implements RetrofitNetwork {
  _RetrofitNetwork(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://620a2b8192946600171c5837.mockapi.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Note>> getNotes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Note>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/notes',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Note.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Note> getNoteWithId(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Note>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/notes/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Note.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Note> createNote(note) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json; charset=UTF-8'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(note.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Note>(
        Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json; charset=UTF-8')
            .compose(_dio.options, '/notes',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Note.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Note> updateNote(id, note) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json; charset=UTF-8'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(note.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Note>(
        Options(
                method: 'PUT',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json; charset=UTF-8')
            .compose(_dio.options, '/notes/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Note.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteNote(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json; charset=UTF-8'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'DELETE',
            headers: _headers,
            extra: _extra,
            contentType: 'application/json; charset=UTF-8')
        .compose(_dio.options, '/notes/${id}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  @override
  Future store({required String title, required int part, File? attach}) {
    // TODO: implement store
    throw UnimplementedError();
  }
}
