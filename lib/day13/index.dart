import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Day13 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day13State();
  }
}

class _Day13State extends State<Day13> {
  final data1 = [
    new OrdinalSales('2014', 5),
    new OrdinalSales('2015', 25),
    new OrdinalSales('2016', 100),
    new OrdinalSales('2017', 75),
  ];

  final data2 = [
    new LinearSales(0, 100),
    new LinearSales(1, 75),
    new LinearSales(2, 25),
    new LinearSales(3, 5),
  ];

  final data3 = [
    new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
    new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
    new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
    new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图表的简单示例'),
      ),

      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 200.0,
              child: new charts.BarChart(
                [
                  new charts.Series<OrdinalSales, String>(
                    id: 'sales1',
                    data: data1,
                    domainFn: (OrdinalSales sales, _) => sales.year,
                    measureFn: (OrdinalSales sales, _) => sales.sales,
                    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  )
                ]
              ),
            ),

            new Container(
              height: 200.0,
              child: new charts.PieChart([
                new charts.Series<LinearSales, int>(
                  id: 'sales2',
                  domainFn: (LinearSales sales, _) => sales.year,
                  measureFn: (LinearSales sales, _) => sales.sales,
                  data: data2,
                  // Set a label accessor to control the text of the arc label.
                  labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
                )
              ]),
            ),

            new Container(
              height: 200.0,
              child: new charts.TimeSeriesChart([
                new charts.Series<TimeSeriesSales, DateTime>(
                  id: 'sales3',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (TimeSeriesSales sales, _) => sales.time,
                  measureFn: (TimeSeriesSales sales, _) => sales.sales,
                  data: data3,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}