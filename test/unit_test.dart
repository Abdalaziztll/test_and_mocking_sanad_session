import 'package:flutter_test/flutter_test.dart';

String filterByFavorite(bool? isFav) {
  if (isFav is bool) {
    if (isFav) {
      return "Hello";
    } else {
      throw Exception();
    }
  } else {
    throw Exception();
  }
}

void main() {
  group("Test FilterByFav function", () {
    test("input with true value", () {
      expect(filterByFavorite(true), isA<String>());
    });

    test("input with false value", () {
      expect(()=>filterByFavorite(false), throwsException);
    });

    test("input with Null value", () {
      expect(()=>filterByFavorite(null), throwsException);
    });
  });
}
