import 'package:barcodescan_qrscan/view/listScans_view.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

main() {
  test(
      "Test para valida la creaciond e un item cuando se lee correctamente un QR o CB",
          () {
        // GIVEN
        List<String> listScans = [
          'https://es.wikipedia.org/wiki/Wikipedia:Portada',
          'ABC-abc-1234',
          '1234567890',
          'Aa-1234',
          '010123456789012890TEC-ITF8200https://www.tec-it.com',
          'https://www.tec-it.comhttps://www.tec-it.com', 'null'
        ];

        VoidCallback? voidCallback;
        // WHEN
        ItemScan(scan: listScans[0], callback: voidCallback);

        //THEN
        //expect(actual, matcher)
      });
}
