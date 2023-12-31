import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/src/data/models.dart';
import 'package:retrofit/retrofit.dart';

///
/// flutter_clean_architecture_2023
/// File Name: remote_datasource
/// Created by sujangmac on 2023/07/10
///
/// Description:
///

part 'remote_data_source.g.dart';

@RestApi(baseUrl: 'https://api.thedogapi.com/v1')
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET('/images/search')
  Future<List<ImageResponse>> getDogImages(@Query('limit') int? limit);
}
