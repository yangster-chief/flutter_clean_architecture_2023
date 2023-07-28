import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';

///
/// flutter_clean_architecture_2023
/// File Name: remote_dog_card_frame
/// Created by sujangmac on 2023/07/29
///
/// Description:
///
class RemoteDogCardFrame extends StatelessWidget {
  const RemoteDogCardFrame({
    super.key,
    required this.items,
    required this.controller,
    required this.onSwipe,
    required this.cards,
    required this.onRefresh,
    required this.onSave,
  });

  final List<DogImage> items;
  final CardSwiperController controller;
  final bool Function(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) onSwipe;
  final List<Widget> cards;
  final void Function() onRefresh;
  final void Function() onSave;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: items.length,
              onSwipe: onSwipe,
              numberOfCardsDisplayed: items.length,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  cards[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: onRefresh,
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: onSave,
                  child: const Icon(Icons.save),
                ),
              ],
            ),
          ),
        ],
      );
}
