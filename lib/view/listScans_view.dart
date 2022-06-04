import 'package:barcodescan_qrscan/providers/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class ListScansView extends StatelessWidget {
  const ListScansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralProvider generalProvider = Provider.of<GeneralProvider>(context);
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: generalProvider.listScans.length,
        itemBuilder: (_, index) {
          return ItemScan(
            scan: generalProvider.listScans[index],
            callback: () {
              generalProvider.deleteScan(index);
            },
          );
        },
      ),
    );
  }
}

class ItemScan extends StatelessWidget {
  final String? scan;
  final VoidCallback? callback;

  const ItemScan({Key? key, this.scan, this.callback}) : super(key: key);
  // final urlPattern = r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  @override
  Widget build(BuildContext context) {
    final generalProvider = Provider.of<GeneralProvider>(context);
    return ListTile(
      leading: const Icon(Icons.qr_code),
      title: isURL(scan!)
          ? GestureDetector(
              onTap: () {
                generalProvider.openLink(scan!);
              },
              child: Text(
                '$scan',
                style: const TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline),
              ),
            )
          : Text('$scan'),
      trailing: IconButton(
        onPressed: () {
          callback!();
        },
        icon: const Icon(Icons.delete, color: Color(0xFFEF5350)),
      ),
    );
  }
}
