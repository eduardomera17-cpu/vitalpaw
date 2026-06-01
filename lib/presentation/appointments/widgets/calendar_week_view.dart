import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Un calendario con formato semanal (Week View) para la agenda.
///
/// Permite al staff ver rápidamente la semana actual y seleccionar un día.
class CalendarWeekView extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarWeekView({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarWeekView> createState() => _CalendarWeekViewState();
}

class _CalendarWeekViewState extends State<CalendarWeekView> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week, // Muestra solo una semana a la vez
        selectedDayPredicate: (day) {
          return isSameDay(widget.selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          widget.onDateSelected(selectedDay);
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
