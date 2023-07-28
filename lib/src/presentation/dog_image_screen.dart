import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2023/injector.dart';
import 'package:flutter_clean_architecture_2023/src/presentation/bloc/dog_images_bloc.dart';
import 'package:flutter_clean_architecture_2023/src/presentation/pages.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog_image_screen
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
class DogImageScreen extends StatelessWidget {
  const DogImageScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => locator<DogImagesBloc>(),
        child: const _DogImageScreen(),
      );
}

class _DogImageScreen extends StatefulWidget {
  const _DogImageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_DogImageScreen> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<_DogImageScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const RemoteDogCardPage(),
    const LocalDogCardPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Remote Dog Image'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Local Dog Image'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('${_selectedIndex == 0 ? 'Remote' : 'Local'} Dog Image'),
        ),
        body: SafeArea(
          child: _widgetOptions[_selectedIndex],
        ),
      );
}
