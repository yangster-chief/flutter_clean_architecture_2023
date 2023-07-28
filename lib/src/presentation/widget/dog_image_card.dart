import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog_image_card
/// Created by sujangmac on 2023/07/24
///
/// Description:
///
class DogImageCard extends StatelessWidget {
  final DogImage item;

  const DogImageCard(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.breeds.isNotEmpty ? item.breeds[0].name : 'No Name',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'weight metric: ${item.breeds.isNotEmpty ? item.breeds[0].weight.metric : 'Not Found'}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'height metric: ${item.breeds.isNotEmpty ? item.breeds[0].height.metric : 'Not Found'}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'life span: ${item.breeds.isNotEmpty ? item.breeds[0].lifeSpan : 'Not Found'}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
