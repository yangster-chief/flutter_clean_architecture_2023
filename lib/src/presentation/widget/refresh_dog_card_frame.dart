import 'package:flutter/material.dart';

///
/// flutter_clean_architecture_2023
/// File Name: refresh_dog_card_frame
/// Created by sujangmac on 2023/07/29
///
/// Description:
///
class RefreshDogCardFrame extends StatelessWidget {
  const RefreshDogCardFrame({
    super.key,
    required this.text,
    required this.onRefresh,
  });

  final String text;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Flexible(
            child: Center(
              child: Text(text),
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
              ],
            ),
          ),
        ],
      );
}
