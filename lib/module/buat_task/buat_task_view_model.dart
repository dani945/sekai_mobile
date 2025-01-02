import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tes_pilarmedia_indonesia/module/model_data.dart';
import 'package:tes_pilarmedia_indonesia/util/date_time_extensions.dart';
import 'package:tes_pilarmedia_indonesia/util/router_extensions.dart';

import '../../theme/i_theme.dart';

class BuatTaskViewModel extends ChangeNotifier {
  BuatTaskViewModel(BuildContext context) {
    initPage(context);
  }

  TextEditingController controllerJudulTugas = TextEditingController();
  TextEditingController controllerDeskripsi = TextEditingController();
  TextEditingController controllerTanggalJatuhTempo = TextEditingController();
  String? selectedOption = "1";
  String status = "";
  int id = 0;

  final _box = Hive.box('myBox');

  Map? resArg;

  void initPage(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getArgument(context);
    });
  }

  void getArgument(BuildContext context) {
    resArg = context.argumentsMap;
    if (resArg != null) {
      if (resArg!["option"] == "1") {
        if (resArg!["dataWork"] != null) {
          ModelData res = resArg!["dataWork"] as ModelData;
          controllerJudulTugas.text = res.judulTugas;
          controllerDeskripsi.text = res.deskripsi;
          controllerTanggalJatuhTempo.text = res.tanggalJatuhTempo;
          status = res.status;
          id = res.id;
        }

        selectedOption = resArg!["option"];

        notifyListeners();
      }
      if (resArg!["option"] == "2") {
        if (resArg!["dataPersonal"] != null) {
          ModelData res = resArg!["dataPersonal"] as ModelData;
          controllerJudulTugas.text = res.judulTugas;
          controllerDeskripsi.text = res.deskripsi;
          controllerTanggalJatuhTempo.text = res.tanggalJatuhTempo;
          status = res.status;
          id = res.id;
        }
        selectedOption = resArg!["option"];

        notifyListeners();
      }
      if (resArg!["option"] == "3") {
        if (resArg!["dataUrgent"] != null) {
          ModelData res = resArg!["dataUrgent"] as ModelData;
          controllerJudulTugas.text = res.judulTugas;
          controllerDeskripsi.text = res.deskripsi;
          controllerTanggalJatuhTempo.text = res.tanggalJatuhTempo;
          status = res.status;
          id = res.id;
        }
        selectedOption = resArg!["option"];

        notifyListeners();
      }
    }
  }

  void selectCategory({required String? value}) {
    selectedOption = value;
    notifyListeners();
  }

  void selectDate(BuildContext context, DateTime? dateTime) {
    if (dateTime != null) {
      controllerTanggalJatuhTempo.text = dateTime.iDateFormatDDMMYYYY;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tanggal Masih kosong'),
        ),
      );
    }
    notifyListeners();
  }

  void saveData(BuildContext context) {
    if (controllerJudulTugas.text.isNotEmpty && controllerDeskripsi.text.isNotEmpty && controllerTanggalJatuhTempo.text.isNotEmpty && selectedOption != null && selectedOption?.isNotEmpty == true) {
      final data = {
        'id': _box.length,
        'judulTugas': controllerJudulTugas.text,
        'deskripsi': controllerDeskripsi.text,
        'tanggalJatuhTempo': controllerTanggalJatuhTempo.text,
        'category': selectedOption,
        'status': "",
      };

      _box.add(data);

      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua Harus di isi'),
        ),
      );
    }
  }

  void updateData(BuildContext context, {required int id}) {
    if (controllerJudulTugas.text.isNotEmpty && controllerDeskripsi.text.isNotEmpty && controllerTanggalJatuhTempo.text.isNotEmpty && selectedOption != null && selectedOption?.isNotEmpty == true) {
      final data = {
        'id': id,
        'judulTugas': controllerJudulTugas.text,
        'deskripsi': controllerDeskripsi.text,
        'tanggalJatuhTempo': controllerTanggalJatuhTempo.text,
        'category': selectedOption,
        'status': status,
      };
      _box.put(id, data);

      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua Harus di isi'),
        ),
      );
    }
  }

  void setTheme(BuildContext context, {required String val}) {
    var theme = context.read<IThemeController>();
    switch (val) {
      case "light":
        theme.changeTheme(IThemeStyle.light);
        break;

      case "dark":
        theme.changeTheme(IThemeStyle.dark);
        break;

      default:
        log("Weather is unpredictable.");
    }
  }
}
