///
/// flutter_clean_architecture_2023
/// File Name: dog_image
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
class DogImage {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<Breed> breeds;

  const DogImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    this.breeds = const [],
  });
}

class Breed {
  final SystemOfMeasurement weight;
  final SystemOfMeasurement height;
  final String id;
  final String name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? referenceImageId;

  const Breed({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
  });
}

class SystemOfMeasurement {
  final String imperial;
  final String metric;

  const SystemOfMeasurement({
    this.imperial = '',
    this.metric = '',
  });
}
