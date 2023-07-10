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
  Future<List<Dog>> getDogImages(
    @Header('x-api-key') String apiKey,
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('order') String? order,
    @Query('has_breeds') String? hasBreeds,
    @Query('breed_ids') String? breedIds,
    @Query('category_ids') String? categoryIds,
    @Query('sub_id') String? subId,
  );
}
