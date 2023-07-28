import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_clean_architecture_2023/src/presentation/bloc/dog_images_bloc.dart';
import 'package:flutter_clean_architecture_2023/src/presentation/widgets.dart';

///
/// flutter_clean_architecture_2023
/// File Name: local_dog_card_page
/// Created by sujangmac on 2023/07/28
///
/// Description:
///
class LocalDogCardPage extends StatefulWidget {
  const LocalDogCardPage({super.key});

  @override
  State<LocalDogCardPage> createState() => _LocalDogCardPageState();
}

class _LocalDogCardPageState extends State<LocalDogCardPage> {
  final CardSwiperController controller = CardSwiperController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<DogImagesBloc>().add(const GetLocalDogImagesEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DogImagesBloc, DogImagesState>(
        builder: (context, state) {
          if (state is LocalDogImagesLoading) {
            return const LoadingDogCardFrame();
          } else if (state is LocalDogImagesLoaded) {
            final cards = state.localImages.map(DogImageCard.new).toList();
            return LocalDogCardFrame(
              items: state.localImages,
              controller: controller,
              onSwipe: _onSwipe,
              cards: cards,
              onClearAll: () {
                context.read<DogImagesBloc>().add(const ClearDogImagesEvent());
              },
              onDelete: () {
                context.read<DogImagesBloc>().add(
                    DeleteDogImageEvent(state.localImages[_currentIndex].id));
                showToastMessage('deleted');
              },
            );
          } else if (state is LocalDogImagesError) {
            return RefreshDogCardFrame(
              text: 'Error : ${state.error.message}',
              onRefresh: () {
                context
                    .read<DogImagesBloc>()
                    .add(const GetLocalDogImagesEvent());
              },
            );
          } else if (state is LocalDogImagesIsEmpty) {
            return RefreshDogCardFrame(
              text: 'Empty',
              onRefresh: () {
                context
                    .read<DogImagesBloc>()
                    .add(const GetLocalDogImagesEvent());
              },
            );
          } else {
            return RefreshDogCardFrame(
              text: 'Need to Refresh',
              onRefresh: () {
                context
                    .read<DogImagesBloc>()
                    .add(const GetLocalDogImagesEvent());
              },
            );
          }
        },
      );

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    _currentIndex = currentIndex ?? 0;
    return true;
  }
}
