import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/module/buat_task/buat_task_view.dart';
import 'package:tes_sekai/module/model_data.dart';
import 'package:tes_sekai/route/route.dart';

import '../../theme/i_theme.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(BuildContext context) {
    initPage(context);
  }

  final box = Hive.box('myBox');
  List<ModelData> dataWork = [];
  List<ModelData> dataPersonal = [];
  List<ModelData> dataUrgent = [];

  List<ModelData> dataWorkTemp = [];
  List<ModelData> dataPersonalTemp = [];
  List<ModelData> dataUrgentTemp = [];

  TextEditingController controllerSearchWork = TextEditingController();
  TextEditingController controllerSearchPersonal = TextEditingController();
  TextEditingController controllerSearchUrgent = TextEditingController();

  void initPage(BuildContext context) {
    readData();
  }

  Future<void> toBuatTask(BuildContext context, {Map<String, dynamic>? argument}) async {
    final res = await goToNamed(context, routeName: BuatTaskView.routeName, arguments: argument);

    if (res != null) {
      if (res == true) {
        readData();
      }
    }
  }

  void readData() {
    dataWork.clear();
    dataPersonal.clear();
    dataUrgent.clear();

    dataWorkTemp.clear();
    dataPersonalTemp.clear();
    dataUrgentTemp.clear();

    final data = box.listenable();

    for (var i = 0; i < data.value.values.length; i++) {
      switch (data.value.values.elementAt(i)["category"]) {
        case "1":
          dataWork.add(ModelData.fromJson(data.value.values.elementAt(i)));
          dataWorkTemp.add(ModelData.fromJson(data.value.values.elementAt(i)));
          notifyListeners();

          break;

        case "2":
          dataPersonal.add(ModelData.fromJson(data.value.values.elementAt(i)));
          dataPersonalTemp.add(ModelData.fromJson(data.value.values.elementAt(i)));
          notifyListeners();
          break;

        case "3":
          dataUrgent.add(ModelData.fromJson(data.value.values.elementAt(i)));
          dataUrgentTemp.add(ModelData.fromJson(data.value.values.elementAt(i)));
          notifyListeners();
          break;

        default:
          log("Weather is unpredictable.");
      }
    }
  }

  void actionButton(
    BuildContext context, {
    required String val,
    required int index,
    required String option,
    required int id,
  }) async {
    switch (val) {
      case "edit":
        toBuatTask(context, argument: {
          "dataWork": dataWork.isNotEmpty ? dataWork[index] : null,
          "dataPersonal": dataPersonal.isNotEmpty ? dataPersonal[index] : null,
          "dataUrgent": dataUrgent.isNotEmpty ? dataUrgent[index] : null,
          "option": option,
        });
        break;

      case "set_pending":
        updateData(
          context,
          index: index,
          category: option,
          status: "pending",
          id: id,
        );
        notifyListeners();
        break;

      case "set_complete":
        updateData(
          context,
          index: index,
          category: option,
          status: "complete",
          id: id,
        );
        notifyListeners();
        break;

      case "delete":
        delete(id: id);
        notifyListeners();
        break;

      default:
        log("Weather is unpredictable.");
    }
  }

  void updateData(
    BuildContext context, {
    required int index,
    required String category,
    required String status,
    required int id,
  }) {
    switch (category) {
      case "1":
        final datalist = dataWork[index];
        if (datalist.judulTugas.isNotEmpty && datalist.deskripsi.isNotEmpty && datalist.tanggalJatuhTempo.isNotEmpty && category.isNotEmpty) {
          final data = {
            'id': id,
            'judulTugas': datalist.judulTugas,
            'deskripsi': datalist.deskripsi,
            'tanggalJatuhTempo': datalist.tanggalJatuhTempo,
            'category': category,
            'status': status,
          };
          box.put(id, data);

          readData();
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Semua Harus di isi'),
            ),
          );
        }
        break;

      case "2":
        final datalist = dataPersonal[index];
        if (datalist.judulTugas.isNotEmpty && datalist.deskripsi.isNotEmpty && datalist.tanggalJatuhTempo.isNotEmpty && category.isNotEmpty) {
          final data = {
            'id': id,
            'judulTugas': datalist.judulTugas,
            'deskripsi': datalist.deskripsi,
            'tanggalJatuhTempo': datalist.tanggalJatuhTempo,
            'category': category,
            'status': status,
          };
          box.put(id, data);

          readData();
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Semua Harus di isi'),
            ),
          );
        }
        break;

      case "3":
        final datalist = dataUrgent[index];
        if (datalist.judulTugas.isNotEmpty && datalist.deskripsi.isNotEmpty && datalist.tanggalJatuhTempo.isNotEmpty && category.isNotEmpty) {
          final data = {
            'id': id,
            'judulTugas': datalist.judulTugas,
            'deskripsi': datalist.deskripsi,
            'tanggalJatuhTempo': datalist.tanggalJatuhTempo,
            'category': category,
            'status': status,
          };
          box.put(id, data);

          readData();
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Semua Harus di isi'),
            ),
          );
        }
        break;

      default:
        log("Weather is unpredictable.");
    }
  }

  void delete({required int id}) {
    box.delete(id);
    readData();
  }

  // Fungsi untuk melakukan pencarian
  Future<void> search(String val, {required String category}) async {
    switch (category) {
      case "1":
        if (val.isNotEmpty) {
          dataWork = dataWorkTemp.where((element) => (element.judulTugas.toLowerCase().contains(val.toLowerCase()))).toList();

          notifyListeners();
        } else {
          dataWork = dataWorkTemp;

          notifyListeners();
        }
        break;

      case "2":
        if (val.isNotEmpty) {
          dataPersonal = dataPersonalTemp.where((element) => (element.judulTugas.toLowerCase().contains(val.toLowerCase()))).toList();

          notifyListeners();
        } else {
          dataPersonal = dataPersonalTemp;

          notifyListeners();
        }
        break;

      case "3":
        if (val.isNotEmpty) {
          dataUrgent = dataUrgentTemp.where((element) => (element.judulTugas.toLowerCase().contains(val.toLowerCase()))).toList();

          notifyListeners();
        } else {
          dataUrgent = dataUrgentTemp;

          notifyListeners();
        }
        break;

      default:
        log("Weather is unpredictable.");
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
