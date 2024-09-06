import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:jiffy/jiffy.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class CalendarDatetimePicker extends StatefulWidget {
  const CalendarDatetimePicker(
      {super.key, this.onChange, this.selectData, this.isContainTime = true});
  final DateTime? selectData;
  final bool isContainTime;
  final Function(DateTime? value)? onChange;
  @override
  State<CalendarDatetimePicker> createState() => _CalendarDatetimePickerState();
}

class _CalendarDatetimePickerState extends State<CalendarDatetimePicker> {
  Jiffy? _selectData;
  @override
  void initState() {
    if (widget.selectData != null) {
      _selectData = Jiffy.parseFromDateTime(widget.selectData!);
    } else {
      _selectData = Jiffy.now();
    }
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.onChange?.call(DateTime.now()));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  // _onUpHour(final String type, final bool isUp) {
  //   if (type == 'hour') {
  //     if (isUp) {
  //       setState(() {
  //         _selectData = _selectData.add(hours: 1);
  //       });
  //     } else {
  //       setState(() {
  //         _selectData = _selectData.subtract(hours: 1);
  //       });
  //     }
  //     widget.onChange?.call(_selectData.dateTime);
  //   } else {
  //     if (isUp) {
  //       setState(() {
  //         _selectData = _selectData.add(minutes: 1);
  //       });
  //     } else {
  //       setState(() {
  //         _selectData = _selectData.subtract(minutes: 1);
  //       });
  //     }
  //     widget.onChange?.call(_selectData.dateTime);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomPopup(
                content: SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    initialDateTime: _selectData?.dateTime,
                    mode: CupertinoDatePickerMode.monthYear,
                    onDateTimeChanged: (value) {
                      setState(() {
                        _selectData = Jiffy.parseFromDateTime(DateTime(
                            value.year,
                            value.month,
                            _selectData?.date ?? DateTime.now().day,
                            _selectData?.hour ?? DateTime.now().hour,
                            _selectData?.minute ?? DateTime.now().minute));
                      });
                      if (_selectData != null) {
                        widget.onChange?.call(_selectData!.dateTime);
                      }
                    },
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                      color: '#E9EBD5'.color,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Utils.dateToString('MMMM yyyy', _selectData?.dateTime)
                          .toUpperCase()
                          .size12
                          .w700,
                      8.sized,
                      Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 15,
                          )),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_upward_rounded).onTap(() {
                setState(() {
                  _selectData = _selectData?.add(months: 1);
                });
                widget.onChange?.call(_selectData?.dateTime);
              }),
              const Icon(Icons.arrow_downward_rounded).onTap(() {
                setState(() {
                  _selectData = _selectData?.subtract(months: 1);
                });
                widget.onChange?.call(_selectData?.dateTime);
              }),
            ],
          ).paddingSymmetric(vertical: 8),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectData?.dateTime ?? DateTime.now(),
            currentDay: _selectData?.dateTime,
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarFormat: CalendarFormat.month,
            weekendDays: const [DateTime.sunday],
            calendarStyle: CalendarStyle(
                weekendDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                disabledDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                outsideDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                holidayDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                defaultDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                todayDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4))),
            daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    Utils.dateToString('EE', date),
                weekdayStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                weekendStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
                decoration: BoxDecoration(
                    color: '#E6E4AC'.color,
                    borderRadius: BorderRadius.circular(4))),
            rowHeight: 40,
            daysOfWeekHeight: 35,
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectData = Jiffy.parseFromDateTime(DateTime(
                    selectedDay.year,
                    selectedDay.month,
                    selectedDay.day,
                    _selectData?.hour ?? 0,
                    _selectData?.minute ?? 0));
                widget.onChange?.call(_selectData?.dateTime);
              });
            },
          ),
          if (widget.isContainTime)
            Divider(
              height: 0,
              color: '#082819'.color,
            ),
          if (widget.isContainTime)
            CustomPopup(
              content: SizedBox(
                height: 200,
                width: 150,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  initialDateTime: _selectData?.dateTime,
                  onDateTimeChanged: (value) {
                    setState(() {
                      _selectData = Jiffy.parseFromDateTime(value);
                    });
                    widget.onChange?.call(_selectData?.dateTime);
                  },
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Utils.dateToString('HH', _selectData?.dateTime)
                          .size14
                          .center),
                  ':'.size20.marginOnly(bottom: 4),
                  Expanded(
                      child: Utils.dateToString('mm', _selectData?.dateTime)
                          .size14
                          .center),
                ],
              ).paddingSymmetric(vertical: 8),
            ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
