import 'package:test/test.dart';

void main() {
  test(
    "test para validar una URL ",
    () {
      //Given
      // var data = 'https://es.wikipedia.org/wiki/Wikipedia:Portada';
      // var data = 'null';
      var data = '';
      // When
      bool valido = Uri.tryParse(data)?.hasAbsolutePath ?? false;
      // Then
      expect(valido, false);
    },
  );
}
