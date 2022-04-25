import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/models/journal_entry.dart';
import 'package:table_calendar/table_calendar.dart';

class JournalCalendar extends StatefulWidget {
  final List<JournalEntry> entries;
  const JournalCalendar(this.entries, {Key? key}) : super(key: key);

  @override
  _JournalCalendarState createState() => _JournalCalendarState();
}

class _JournalCalendarState extends State<JournalCalendar> with AutomaticKeepAliveClientMixin{
  late final ValueNotifier<List<JournalEntry>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<JournalEntry> _getEventsForDay(DateTime day) {
    // Implementation example
    return widget.entries.where((entry) {
      DateTime eventDate =
          DateTime.fromMillisecondsSinceEpoch(entry.timestamp.toInt());
      return day.year == eventDate.year &&
          day.month == eventDate.month &&
          day.day == eventDate.day;

    }).toList();
  }

  List<JournalEntry> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TableCalendar<JournalEntry>(
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now(),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              markerDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2)
              )
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 35.0),
          _selectedDay != null
              ? Text("Entries for ${DateFormat.yMMMd().format(_selectedDay!)}")
              : Container(),
          const SizedBox(height: 15.0),
          ValueListenableBuilder<List<JournalEntry>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return value.length <=0 ? Container(
                child: Center(
                  child: Text("No Entry Found!"),
                ),
              ) : CarouselSlider.builder(
                itemCount: value.length,
                itemBuilder: (context, index, g) {
                  return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black26,blurRadius: 12)
                        ],
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.circular(12.0),
                          color: MSColors.card),
                      child: Column(
                        children: [
                          Text(
                            value[index].title ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            constraints: BoxConstraints(maxWidth: 180),
                              child: Text(
                            value[index].notes ?? "ghgjhj",
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10),
                          ))
                        ],
                      ));
                },
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.2,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
