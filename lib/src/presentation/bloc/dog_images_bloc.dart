import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/dto.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';
import 'package:flutter_clean_architecture_2023/src/domain/usecase/clear_dog_images_usecase.dart';
import 'package:flutter_clean_architecture_2023/src/domain/usecase/delete_dog_image_usecase.dart';
import 'package:flutter_clean_architecture_2023/src/domain/usecase/get_dog_images_usecase.dart';
import 'package:flutter_clean_architecture_2023/src/domain/usecase/save_dog_image_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog_images_bloc
/// Created by sujangmac on 2023/07/14
///
/// Description:
///
part 'dog_images_event.dart';
part 'dog_images_state.dart';

@injectable
class DogImagesBloc extends Bloc<DogImagesEvent, DogImagesState> {
  DogImagesBloc(
    GetDogImagesUseCase getDogImagesUseCase,
    SaveDogImageUseCase saveDogImageUseCase,
    DeleteDogImageUseCase deleteDogImageUseCase,
    ClearDogImagesUseCase clearDogImagesUseCase,
  )   : _getDogImagesUseCase = getDogImagesUseCase,
        _saveDogImageUseCase = saveDogImageUseCase,
        _deleteDogImageUseCase = deleteDogImageUseCase,
        _clearDogImagesUseCase = clearDogImagesUseCase,
        super(const RemoteDogImagesLoading()) {
    on<GetRemoteDogImagesEvent>(_onRemoteGetDogImages);
    on<GetLocalDogImagesEvent>(_onGetLocalDogImages);
    on<SaveDogImageEvent>(_onSaveDogImage);
    on<DeleteDogImageEvent>(_onDeleteDogImage);
    on<ClearDogImagesEvent>(_onClearDogImages);
  }

  final GetDogImagesUseCase _getDogImagesUseCase;
  final SaveDogImageUseCase _saveDogImageUseCase;
  final DeleteDogImageUseCase _deleteDogImageUseCase;
  final ClearDogImagesUseCase _clearDogImagesUseCase;

  void _onRemoteGetDogImages(
    GetRemoteDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    emit(const RemoteDogImagesLoading());
    await _getDogImagesUseCase.call(
      params: GetDogDto(isRemote: true, limit: event.limit),
      onSuccess: (data) async => emit(RemoteDogImagesLoaded(data)),
      onFailure: (error) async => emit(RemoteDogImagesError(error)),
    );
  }

  void _onGetLocalDogImages(
    GetLocalDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    emit(const LocalDogImagesLoading());
    await _getDogImagesUseCase.call(
      params: const GetDogDto(isRemote: false),
      onSuccess: (data) async {
        if (data.isEmpty) {
          emit(const LocalDogImagesIsEmpty());
        } else {
          emit(LocalDogImagesLoaded(data));
        }
      },
      onFailure: (error) async => emit(LocalDogImagesError(error)),
    );
  }

  void _onSaveDogImage(
    SaveDogImageEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _saveDogImageUseCase.call(
      params: event.dogImage,
      onSuccess: (data) async {},
      onFailure: (error) async => emit(LocalDogImagesError(error)),
    );
  }

  void _onDeleteDogImage(
    DeleteDogImageEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _deleteDogImageUseCase.call(
      params: event.id,
      onSuccess: (data) async {
        // trigger get local dog images event
        add(const GetLocalDogImagesEvent());
      },
      onFailure: (error) async => emit(LocalDogImagesError(error)),
    );
  }

  void _onClearDogImages(
    ClearDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _clearDogImagesUseCase.call(
      params: null,
      onSuccess: (data) async => emit(const LocalDogImagesIsEmpty()),
      onFailure: (error) async => emit(LocalDogImagesError(error)),
    );
  }
}
