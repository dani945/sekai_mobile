import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tes_sekai/module/qr_scaner/qr_scaner_view_model.dart';
import 'package:tes_sekai/util/context_extensions.dart';

class QrScanerView extends StatefulWidget {
  static const routeName = "/QrScanerView";

  const QrScanerView({Key? key}) : super(key: key);

  @override
  State<QrScanerView> createState() => _QrScanerViewState();
}

class _QrScanerViewState extends State<QrScanerView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QrScanerViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<QrScanerViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Barcode Scan'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: context.mQWidth(0.6),
                width: context.mQWidth(0.6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: QRView(
                    key: provider.qrKey,
                    onQRViewCreated: (p0) => provider.onQRViewCreated(context, p0),
                  ),
                ),
              ),
              context.sbHeight(),
              const Text("Letakkan barcode tepat didalam kotak"),
            ],
          ),
        ),
      );
    });
  }
}
