///
/// flutter_clean_architecture_2023
/// File Name: dog_images_event
/// Created by sujangmac on 2023/07/14
///
/// Description:
///
part of 'dog_images_bloc.dart';

sealed class DogImagesEvent extends Equatable {
  const DogImagesEvent();

  @override
  List<Object> get props => [];
}

class GetRemoteDogImagesEvent extends DogImagesEvent {
  final bool isForceUpdate;
  final int limit;

  const GetRemoteDogImagesEvent({this.isForceUpdate = true, this.limit = 10});
}

class GetLocalDogImagesEvent extends DogImagesEvent {
  const GetLocalDogImagesEvent();
}

class SaveDogImageEvent extends DogImagesEvent {
  final DogImage dogImage;

  const SaveDogImageEvent(this.dogImage);
}

class DeleteDogImageEvent extends DogImagesEvent {
  final String id;

  const DeleteDogImageEvent(this.id);
}

class ClearDogImagesEvent extends DogImagesEvent {
  const ClearDogImagesEvent();
}
