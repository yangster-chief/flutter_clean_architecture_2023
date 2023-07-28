///
/// flutter_clean_architecture_2023
/// File Name: dog_images_state
/// Created by sujangmac on 2023/07/24
///
/// Description:
///
part of 'dog_images_bloc.dart';

sealed class DogImagesState extends Equatable {
  final List<DogImage> remoteImages;
  final List<DogImage> localImages;
  final AppError error;
  const DogImagesState({
    this.remoteImages = const [],
    this.localImages = const [],
    this.error = const AppError(),
  });

  @override
  List<Object> get props => [remoteImages, localImages, error];
}

class DogImagesInitial extends DogImagesState {
  const DogImagesInitial();
}

class RemoteDogImagesLoading extends DogImagesState {
  const RemoteDogImagesLoading();
}

class LocalDogImagesLoading extends DogImagesState {
  const LocalDogImagesLoading();
}

class RemoteDogImagesLoaded extends DogImagesState {
  const RemoteDogImagesLoaded(List<DogImage> images)
      : super(remoteImages: images);
}

class LocalDogImagesLoaded extends DogImagesState {
  const LocalDogImagesLoaded(List<DogImage> images)
      : super(localImages: images);
}

class LocalDogImagesIsEmpty extends DogImagesState {
  const LocalDogImagesIsEmpty();
}

class RemoteDogImagesError extends DogImagesState {
  const RemoteDogImagesError(AppError error) : super(error: error);
}

class LocalDogImagesError extends DogImagesState {
  const LocalDogImagesError(AppError error) : super(error: error);
}
