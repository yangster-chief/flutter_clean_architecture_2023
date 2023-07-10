import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggy/loggy.dart';

///
/// flutter_clean_architecture_2023
/// File Name: unit_test
/// Created by sujangmac on 2023/07/10
///
/// Description:
///

void main() {
  setUp(() {
    Loggy.initLoggy();
  });

  test('test', () {
    Result<String> result = const Success('success');
    expect(result.isSuccess, true);
    expect(result.data, 'success');
    Result<String> result2 = const Failure('failure');
    expect(result2.isSuccess, false);
  });
}
