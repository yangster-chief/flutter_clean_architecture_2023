import 'package:json_annotation/json_annotation.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
part 'dog.g.dart';

@JsonSerializable()
class Dog {
  final String id;
  final String url;
  final int width;
  final int height;

  const Dog({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}
