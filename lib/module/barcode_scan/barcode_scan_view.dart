import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/module/barcode_scan/barcode_scan_view_model.dart';
import 'package:tes_sekai/util/context_extensions.dart';

class BarcodeScannerView extends StatefulWidget {
  static const routeName = "/BarcodeScannerView";

  const BarcodeScannerView({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BarcodeScannerViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<BarcodeScannerViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Barcode Scan'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: TextFormField(
                      controller: provider.controllerNamaBarang,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        labelText: 'Nama Barang*',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                      onChanged: (value) => provider.validasiForm(),
                    ),
                  ),
                  context.sbHeight(),
                  ElevatedButton(
                    onPressed: provider.submitButton
                        ? () {
                            provider.toQrScannerPage(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.qr_code,
                          size: 16,
                        ),
                        context.sbWidth(),
                        const Text('Scan'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
