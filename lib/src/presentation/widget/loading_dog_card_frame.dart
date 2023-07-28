import 'package:flutter/material.dart';

///
/// flutter_clean_architecture_2023
/// File Name: loading_dog_card_frame
/// Created by sujangmac on 2023/07/29
///
/// Description:
///
class LoadingDogCardFrame extends StatelessWidget {
  const LoadingDogCardFrame({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
