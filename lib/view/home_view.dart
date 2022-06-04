import 'package:barcodescan_qrscan/providers/general_provider.dart';
import 'package:barcodescan_qrscan/view/listScans_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String ROUTE = "homeviewroute";

  @override
  State<HomeView> createState() => _HomeViewState();
}

late GeneralProvider _generalProvider;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    _generalProvider = Provider.of<GeneralProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await scanCamera();
              },
              icon: const Icon(Icons.camera_alt)),
          Visibility(
            visible: _generalProvider.listScans.isNotEmpty,
            child: IconButton(
                onPressed: () {
                  _generalProvider.cleanList();
                },
                icon: const Icon(Icons.delete_forever)),
          ),
        ],
      ),
      body: _generalProvider.listScans.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                    'En esta sección encontraras tus códigos de barra y códigos Qr escaneados. Inicia escaneando tu primer código..'),
              ),
            )
          : const ListScansView(),
    );
  }

  Future<void> scanCamera() async {
    late String scanRes;
    try {
      scanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      scanRes = 'Failed to get platform version.';
    }
    if (scanRes != '-1') {
      _generalProvider.saveScan(scanRes);
    }
    if (!mounted) return;
  }
}
