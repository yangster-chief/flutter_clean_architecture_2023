import 'package:flutter_clean_architecture_2023/module/hive/hive_service.dart';
import 'package:flutter_clean_architecture_2023/src/data/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

///
/// flutter_clean_architecture_2023
/// File Name: local_test
/// Created by sujangmac on 2023/07/17
///
/// Description:
///
// class MockHiveInterface extends Mock implements HiveInterface {}
//
// class MockHiveBox extends Mock implements Box {}
//
// void main() {
//   MockHiveInterface mockHiveInterface;
//   MockHiveBox mockHiveBox;
//   // HiveMovieSearchRepo hiveMovieSearchRepo;
//   setUp(() {
//     mockHiveInterface = MockHiveInterface();
//     mockHiveBox = MockHiveBox();
//     hiveMovieSearchRepo = HiveMovieSearchRepo(hive: mockHiveInterface);
//   });
//
//   group('cacheMoviedetails', () {
//     test('should cache the movie details', () async {
//       //arrange
//
//       when(mockHiveInterface.openBox<dynamic>(any))
//           .thenAnswer((_) async => mockHiveBox);
//       //act
//       await hiveMovieSearchRepo.cacheMovieDetails(tcacheMovieDetails);
//       //assert
//       verify(mockHiveBox.put('${movie.id}', tmovie));
//       verify(mockHiveInterface.openBox("MovieDetailedBox"));
//     });
//   });
//
//   // group('getLocalCitiesAndCountriesAtPage', () {
//   //   test('should when', () async {
//   //     //arrange
//   //     when(mockHiveInterface.openBox(any))
//   //         .thenAnswer((realInvocation) async => mockHiveBox);
//   //     when(mockHiveBox.get('$id'))
//   //         .thenAnswer((realInvocation) async => tmoviedetails);
//   //     //act
//   //     final result = await hiveMovieSearchRepo.getCachedMovieDetails(tId);
//   //     //assert
//   //     verify(mockHiveInterface.openBox(any));
//   //     verify(mockHiveBox.get('page${tpage.toString()}'));
//   //     expect(result, tmoviedetails);
//   //   });
//   // });
// }
//

// First, create mocks for the Hive and Box classes.
class MockHive extends Mock implements HiveInterface {}

class MockBox<T> extends Mock implements Box<T> {}

void main() {
  // Mock objects.
  late MockHive mockHive;
  late MockBox<DogImageModel> mockDogImageBox;
  late MockBox<BreedModel> mockBreedBox;

  // The HiveService instance to test.
  late HiveService hiveService;

  setUp(() async {
    mockHive = MockHive();
    mockDogImageBox = MockBox<DogImageModel>();
    mockBreedBox = MockBox<BreedModel>();

    // Whenever Hive.initFlutter() is called, do nothing.
    when(mockHive.initFlutter()).thenAnswer((_) => Future.value());

    // Whenever Hive.openBox<DogImageModel> is called, return the mock dog image box.
    when(mockHive.openBox<DogImageModel>('dog_image'))
        .thenAnswer((_) => Future.value(mockDogImageBox));

    // Whenever Hive.openBox<BreedModel> is called, return the mock breed box.
    when(mockHive.openBox<BreedModel>('breed'))
        .thenAnswer((_) => Future.value(mockBreedBox));

    // // Replace the Hive singleton instance with the mock instance.
    Hive = mockHive;

    hiveService = await HiveService.init();
  });

  tearDown(() {
    hiveService.close();
  });

  group('HiveService', () {
    test('Initializes Hive and opens boxes', () {
      // The mock methods should have been called once each.
      verify(mockHive.initFlutter()).called(1);
      verify(mockHive.openBox<DogImageModel>('dog_image')).called(1);
      verify(mockHive.openBox<BreedModel>('breed')).called(1);
    });

    test('Provides access to the dog image box', () {
      expect(hiveService.dogImage, equals(mockDogImageBox));
    });

    test('Provides access to the breed box', () {
      expect(hiveService.breed, equals(mockBreedBox));
    });

    test('Closes Hive when close() is called', () {
      hiveService.close();
      verify(mockHive.close()).called(1);
    });
  });
}
