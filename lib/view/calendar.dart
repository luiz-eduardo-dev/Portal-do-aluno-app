import 'package:flutter/material.dart';
import 'package:portal_do_aluno_app/view/home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'loginPage.dart';

class Calendar extends StatefulWidget {

  final String title;
  Calendar(this.title);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Home('Portal do aluno - Menu'))
            );
          },
          child: Icon(
            Icons.arrow_back,  // add custom icons also
          ),
        ),
        title: Text('Calendário'),),
      body:Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 12),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                weekendTextStyle: TextStyle(color: Colors.red),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.5),
                ),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                )
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
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
          Container(
            child: Text('Datas Importantes:'),
          )
        ],
      )
    );
  }
}
