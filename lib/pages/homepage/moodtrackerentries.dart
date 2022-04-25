import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';

import '../../components /appBar.dart';
import 'package:mindseries/models/mood.dart';
import '../../providers/database_provider.dart';
import '../../providers/profile_context.dart';
import '../splash_screen.dart';

class MoodTrackerEntriesPage extends StatefulWidget {
  @override
  State<MoodTrackerEntriesPage> createState() => _MoodTrackerEntriesPageState();
}

class _MoodTrackerEntriesPageState extends State<MoodTrackerEntriesPage> {
  final dayFilter = ["7 days ago", "30 days ago", "90 days ago", "This year"];

  String curFilter = "7 days ago";

  @override
  Widget build(BuildContext context) {
    num from = DateTime.now()
        .subtract(Duration(
            days: curFilter == dayFilter[0]
                ? 7
                : curFilter == dayFilter[1]
                    ? 30
                    : curFilter == dayFilter[2]
                        ? 90
                        : 365))
        .millisecondsSinceEpoch;
    num to = DateTime.now().millisecondsSinceEpoch;

    print(ProfileContext.of(context).profile.fname);
    return Scaffold(
      appBar: MSAppBar.getAppBar(actions: [
        IconButton(
          onPressed: () {
            NavigationControl(nextPage: MoodTrackerGreetingPage())
                .navTo(context);
          },
          icon: Icon(Icons.add_box),
        )
      ]),
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Mood>>(
          stream: DBProvider.of(context)?.db?.retrieveMoods(
              uid: ProfileContext.of(context).profile.uid, from: from, to: to),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return SplashScreen();

              default:
                final moods = snapshot.data ?? [];
                return moods.length > 0
                    ? Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Mood Tracker',
                                      style: TextStyle(
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                          color: Colors.white),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),

                            Container(
                              height: 60,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: dayFilter.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ChoiceChip(
                                        onSelected: (b) {
                                          setState(() {
                                            curFilter = e;
                                          });
                                        },
                                        label: Text(e),
                                        selected: e == curFilter,
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Cabin',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }).toList()),
                            ),

                            _buildChart(moods),
                            SizedBox(
                              height: 20,
                            ),
                            //Graph

                            //Mood entries
                            Container(
                                height: 20,
                                //   color: Colors.white,
                                child: Row(
                                  children: [
                                    Text(
                                      'Mindful Mood Entries',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 17,
                                        fontFamily: 'Cabin',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),

                            SizedBox(
                              height: 20,
                            ),

                            _buildEntries(moods),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    : Container();
            }
          },
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Day 0', style: style);
        break;
      case 1:
        text = const Text('1D', style: style);
        break;
      case 7:
        text = const Text('7D', style: style);
        break;
      case 30:
        text = const Text('30D', style: style);
        break;
      case 60:
        text = const Text('60D', style: style);
        break;
      case 90:
        text = const Text('90D', style: style);
        break;
      case 365:
        text = const Text('1YR', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 10.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    MoodTrackerReaction reaction;
    switch (value.toInt()) {
      case 1:
       reaction = MoodTrackerReaction.neutral;
        break;
      case 2:
        reaction = MoodTrackerReaction.good;
        break;
      case 3:
        reaction = MoodTrackerReaction.great;
        break;
      case 4:
        reaction = MoodTrackerReaction.sad;
        break;
      case 5:
        reaction = MoodTrackerReaction.miserable;
        break;
      default:
        return Container();
    }

    return  Icon(reaction.icon,color: reaction.color,);
  }

  _buildChart(List<Mood> moods) {

    num maxDay = 1;
    LineChartBarData bar_data = LineChartBarData(
      isCurved: true,
      color: const Color(0x99aa4cfc),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: const Color(0x33aa4cfc),
      ),
      spots: moods.map((e) {
        maxDay = max(maxDay,DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(e.timestamp.toInt())).inDays.toDouble());
        return FlSpot(DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(e.timestamp.toInt())).inDays.toDouble(),e.reaction?.value??0);}).toList(),
    );

    LineChartData data = LineChartData(
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      ),
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: leftTitleWidgets,
            showTitles: true,
            interval: 1,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      lineBarsData: [bar_data],
      minX: 1,
      maxX: curFilter == dayFilter[0] ? 7 :
      curFilter == dayFilter[1] ? 30 :
      curFilter == dayFilter[2] ? 90 : 365 ,
      maxY: 6,
      minY: 0,
    );

    return AspectRatio(
        aspectRatio: 0.83,
        child: Container(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 27,
              ),
               Text(
                curFilter,
                style: TextStyle(
                  color: Color(0xff827daa),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Mood Chart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 27,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0,bottom: 8),
                  child: LineChart(data),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        )));
  }

  _buildEntries(List<Mood> moods) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: CarouselSlider.builder(
            itemCount: moods.length,
            itemBuilder: (_, index, x) {
              return _buildEntry(moods,index);
            },
            options: CarouselOptions(
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                enableInfiniteScroll: false)));
  }

  _buildEntry(List<Mood> moods,int index) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (_){
          return AlertDialog(
              content: Container(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [

                        Icon(moods[index].reaction?.icon,size: 40,),
                        SizedBox(height: 10,),
                        Text(
                            '${moods[index].reaction?.name} ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(moods[index].timestamp.toInt()))}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                  ],
                ),
              ),
          );
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(10),
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Icon(
                moods[index].reaction?.icon,
                color: moods[index].reaction?.color,
                size: 40,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${moods[index].reaction?.name} ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(moods[index].timestamp.toInt()))}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(moods[index].timestamp.toInt()))}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 11,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
