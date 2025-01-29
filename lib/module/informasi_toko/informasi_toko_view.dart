import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/util/context_extensions.dart';

import 'informasi_toko_view_model.dart';

class InformasiTokoView extends StatefulWidget {
  static const routeName = "/InformasiTokoView";

  const InformasiTokoView({Key? key}) : super(key: key);

  @override
  State<InformasiTokoView> createState() => _InformasiTokoViewState();
}

class _InformasiTokoViewState extends State<InformasiTokoView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => InformasiTokoViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<InformasiTokoViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.edit),
          //     onPressed: () {
          //       provider.editAction();
          //     },
          //   ),
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: 'Informasi Toko'),
                    Tab(text: 'Foto Toko'),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                      TextFormField(
                        controller: provider.controllerNamaToko,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Nama Toko' : 'Nama Toko*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerJenisToko,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Jenis Toko' : 'Jenis Toko*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerNoKtp,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        buildCounter: (BuildContext context, {required int currentLength, required int? maxLength, required bool isFocused}) {
                          return null; // Menghilangkan tampilan counter
                        },
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'No. KTP' : 'No. KTP*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerNamaPemilik,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Nama Pemilik' : 'Nama Pemilik*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerAlamatToko,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Alamat Toko' : 'Alamat Toko*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerKodePos,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Kode Pos' : 'Kode Pos*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerLokasiToko,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Lokasi Toko' : 'Lokasi Toko*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerNoTelp,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'No Telepon' : 'No Telepon*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerKota,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'Kota' : 'Kota*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      context.sbHeight(),
                      TextFormField(
                        controller: provider.controllerEmail,
                        readOnly: provider.readonlyForm,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: provider.readonlyForm ? 'email' : 'email*',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                          errorText: provider.errorEmail,
                          errorBorder: provider.errorEmail != null
                              ? const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                                )
                              : null,
                        ),
                        onChanged: (value) => provider.validasiForm(),
                      ),
                      if (!provider.readonlyForm) ...[
                        context.sbHeight(),
                        TextFormField(
                          controller: provider.controllerPass,
                          obscureText: provider.isVisiblePass,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: provider.readonlyForm ? 'Password' : 'Password*',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () => provider.tapVisiblePassBaru(),
                              child: Icon(provider.isVisiblePass ? Icons.visibility : Icons.visibility_off),
                            ),
                            errorText: provider.erorrTextPass,
                            errorBorder: provider.erorrTextPass != null
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  )
                                : null,
                          ),
                          onChanged: (value) => provider.validasiForm(),
                        ),
                        context.sbHeight(),
                        TextFormField(
                          controller: provider.controllerKonfirmasi,
                          obscureText: provider.isVisiblePassKonfirmasi,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: provider.readonlyForm ? 'Konfirmasi Password' : 'Konfirmasi Password*',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () => provider.tapVisiblePassKonfirmasi(),
                              child: Icon(provider.isVisiblePassKonfirmasi ? Icons.visibility : Icons.visibility_off),
                            ),
                            errorText: provider.erorrTextPassKonfirmasi,
                            errorBorder: provider.erorrTextPassKonfirmasi != null
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  )
                                : null,
                          ),
                          onChanged: (value) => provider.validasiForm(),
                        ),
                        context.sbHeight(size: 32),
                        ElevatedButton(
                          onPressed: provider.submitButton
                              ? () {
                                  provider.editAction(context);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Text('Simpan'),
                        ),
                      ]
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
