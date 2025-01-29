import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tes_sekai/util/context_extensions.dart';
import 'package:tes_sekai/util/date_time_extensions.dart';
import 'package:tes_sekai/util/router_extensions.dart';

import '../theme/i_colors.dart';
import 'i_button.dart';
import 'i_outline_button.dart';

class IShowDatePicker {
  static Future<DateTime?> dateOfBirth(
    BuildContext context, {
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime firstDateDefault = firstDate ?? DateTime(DateTime.now().year - 150);
    DateTime lastDateDefault = lastDate ?? DateTime(DateTime.now().year + 150);

    if (lastDateDefault.isAfter(DateTime.now())) {
      lastDateDefault = DateTime(DateTime.now().year + 150);
    }

    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDateDefault,
      lastDate: lastDateDefault,
      initialEntryMode: initialEntryMode,
      cancelText: 'back',
      confirmText: 'choose',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primary,
              surfaceTint: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static Future<DateTime?> single(
    BuildContext context, {
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime firstDateDefault = firstDate ?? DateTime(DateTime.now().year - 150);
    DateTime lastDateDefault = lastDate ?? DateTime.now();

    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDateDefault,
      lastDate: lastDateDefault,
      initialEntryMode: initialEntryMode,
      cancelText: 'back',
      confirmText: 'choose',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primary,
              surfaceTint: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static Future<IDateTimeRange?> range(
    BuildContext context, {
    IDateTimeRange? initialPickerRangeDate,
    DateTime? minDate,
  }) async {
    return await showDialog<IDateTimeRange>(
      context: context,
      builder: (BuildContext context) {
        return _IDateRangePicker(
          initialPickerRangeDate: initialPickerRangeDate,
          minDate: minDate,
        );
      },
    );
  }

  static Future<List<DateTime>?> multiple(
    BuildContext context, {
    List<DateTime>? initialSelectedDates,
    DateTime? minDate,
  }) async {
    return await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return _IDateRangePicker(
          initialSelectedDates: initialSelectedDates,
          selectionMode: DateRangePickerSelectionMode.multiple,
          minDate: minDate,
        );
      },
    );
  }

  static Future<DateTime?> dateTime(
    BuildContext context, {
    TimeOfDay initialTime = const TimeOfDay(hour: 0, minute: 0),
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    try {
      DateTime? date;

      var pickDate = await single(
        context,
        lastDate: lastDate,
        initialDate: initialDate,
        firstDate: firstDate,
        initialEntryMode: initialEntryMode,
      );

      if (context.mounted && pickDate != null) {
        var pickTime = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 0, minute: 0),
          cancelText: 'back',
          confirmText: 'choose',
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Palette.primary,
                  surfaceTint: Colors.white,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickTime != null) {
          date = DateTime(
            pickDate.year,
            pickDate.month,
            pickDate.day,
            pickTime.hour,
            pickTime.minute,
          );
        }
      }
      return date;
    } catch (e) {
      return null;
    }
  }
}

class IDateTimeRange {
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  IDateTimeRange({this.rangeStartDate, this.rangeEndDate});
}

class _IDateRangePicker extends StatefulWidget {
  const _IDateRangePicker({
    this.initialPickerRangeDate,
    this.initialSelectedDates,
    this.selectionMode = DateRangePickerSelectionMode.range,
    this.minDate,
  });

  final IDateTimeRange? initialPickerRangeDate;
  final List<DateTime>? initialSelectedDates;
  final DateRangePickerSelectionMode selectionMode;

  /// Default: Tanggal besok
  final DateTime? minDate;

  @override
  State<_IDateRangePicker> createState() => __IDateRangePickerState();
}

class __IDateRangePickerState extends State<_IDateRangePicker> {
  String selectedDate = DateTime.now().iDayDate;
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  List<DateTime>? selectedDateTime;

  bool get canChoose {
    DateTime minimumDate = widget.minDate ?? DateTime.now();

    if (rangeStartDate == null) return false;
    if (rangeEndDate == null) return false;
    if ((rangeStartDate?.isBefore(minimumDate) ?? false) || (rangeEndDate?.isBefore(minimumDate) ?? false)) {
      return false;
    }

    return true;
  }

  void selectDate(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      String? rangeStartDateStr;
      String? rangeEndDateStr;

      if (args.value.startDate is DateTime) {
        rangeStartDate = args.value.startDate;
        rangeStartDateStr = rangeStartDate?.iDayDate;
      }

      if (args.value.endDate is DateTime) {
        rangeEndDate = args.value.endDate;
        rangeEndDateStr = rangeEndDate?.iDayDate;
      }

      setState(() {
        selectedDate = "$rangeStartDateStr${rangeEndDateStr != null ? ' - $rangeEndDateStr' : ""}";
      });
    } else if (args.value is List) {
      final List<DateTime> selectedDates = args.value;
      selectedDateTime = selectedDates;
    }
  }

  void setValueDate() {
    if (widget.selectionMode == DateRangePickerSelectionMode.range) {
      IDateTimeRange date = IDateTimeRange(
        rangeEndDate: rangeEndDate,
        rangeStartDate: rangeStartDate,
      );
      context.pop(date);
      return;
    }

    if (widget.selectionMode == DateRangePickerSelectionMode.multiple) {
      context.pop(selectedDateTime);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.sbHeight(),
                Text(
                  'Choose Date',
                  style: context.subtitle1,
                ),
                context.sbHeight(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate,
                        style: context.headline2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Palette.black),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: _buildDateRangePicker(
              context,
              initialSelectedRange: widget.initialPickerRangeDate,
              selectionMode: widget.selectionMode,
              initialSelectedDates: widget.initialSelectedDates,
            ),
          ),
          const Divider(color: Palette.neutral40),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.sbWidth(),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: IOutlineButton.custom(
                      onPressed: () {
                        context.pop();
                      },
                      title: 'cancel',
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                context.sbWidth(),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: IButton.custom(
                      onPressed: canChoose ? setValueDate : null,
                      title: 'choose',
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                context.sbWidth(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDateRangePicker(
    BuildContext context, {
    IDateTimeRange? initialSelectedRange,
    List<DateTime>? initialSelectedDates,
    DateRangePickerSelectionMode selectionMode = DateRangePickerSelectionMode.range,
  }) {
    return SfDateRangePicker(
      headerHeight: 48,
      initialSelectedRange: PickerDateRange(
        initialSelectedRange?.rangeStartDate,
        initialSelectedRange?.rangeEndDate,
      ),
      initialSelectedDates: initialSelectedDates,
      selectionMode: selectionMode,
      onSelectionChanged: selectDate,
      headerStyle: DateRangePickerHeaderStyle(textStyle: context.headline3),
      monthCellStyle: DateRangePickerMonthCellStyle(
        textStyle: context.headline5,
        disabledDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
        trailingDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
        leadingDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
      ),
      monthViewSettings: DateRangePickerMonthViewSettings(
        showTrailingAndLeadingDates: true,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: context.labelSmall?.copyWith(
            color: Palette.neutral40,
          ),
        ),
      ),
      rangeTextStyle: context.headline5,
    );
  }
}
