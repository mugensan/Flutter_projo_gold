import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCharts extends StatefulWidget {
  @override
  _MyChartsState createState() => _MyChartsState();
}

class _MyChartsState extends State<MyCharts> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var pieData = [
      new Task('Bitcoin', 10.0, Colors.purpleAccent),
      new Task('Bitshares', 12.0, Colors.amberAccent),
      new Task('Ethereum', 12.0, Colors.blueAccent),
      new Task('CounterParty', 6.0, Colors.redAccent),
      new Task('Lykke', 5.0, Colors.greenAccent),
      new Task('PeerCoin', 10.0, Colors.pinkAccent),
      new Task('Zcash', 15.0, Colors.tealAccent),
      new Task('Singular', 3.0, Colors.orangeAccent),
      new Task('LiteCoin', 10.0, Colors.lightBlueAccent),
    ];
    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskValue,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorVal),
      id: 'My Cryptos',
      labelAccessorFn: (Task row, _) => '${row.task},${row.taskValue}',
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
//      backgroundColor: Colors.teal,
          appBar: new AppBar(
            title: new Text('Portfolio2'),
            centerTitle: true,

            ///this target transition between android and IOS
            elevation:
                debugDefaultTargetPlatformOverride == TargetPlatform.android
                    ? 5.0
                    : 0.0,
            bottom: TabBar(
              indicatorColor: Colors.teal,
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
              ],
            ),
          ),
//body: Drawer(),

          ///creating the drawer for the homepage/dashboard
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("Kevin Roditi"),
                  accountEmail: new Text("kevin@gmail.com"),
                  currentAccountPicture: ClipOval(
                    child: Image.asset(
                      "assets/mugenThinker.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  otherAccountsPictures: <Widget>[
                    new ClipOval(
                      child: Image.asset(
                        "assets/mugenThinker.png",
                        fit: BoxFit.contain,
//                child: new Text("K"),
                      ),
                    ),
                  ],
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Dashboard"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/DashboardPage");
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Crypto"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/CryptoPage");
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Stock"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/StocksPage");
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Portfolio"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/PortfolioPage");
                  },

                  ///TODO ADD ROUTE
                ),
                new Divider(),
                new ListTile(
                  title: new Text("About me"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/AboutMePage");
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Report"),
                  trailing: new Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/ReportPage");
                  },

                  ///TODO ADD ROUTE
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Close Menu"),
                  trailing: new Icon(Icons.close),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                     children: <Widget>[
                       Text(
                         'My crypto portfolio',
                         style: TextStyle(
                           fontSize: 24.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       SizedBox(
                         height: 10.0,
                       ),
                       Expanded(
                         child: charts.PieChart(
                           _seriesPieData,
                           animate: true,
                           animationDuration: Duration(seconds: 3),
                           behaviors: [
                             new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                               horizontalFirst: false,
                               desiredMaxRows: 3,
                               cellPadding: new EdgeInsets.only(left: 16.0,right: 16.0,bottom: 4.0),
                               entryTextStyle: charts.TextStyleSpec(
                                 color:charts.MaterialPalette.purple.shadeDefault,
                                 fontFamily: 'Georgia',
                                 fontSize: 11,
                               )
                             ),
                           ],
                           defaultRenderer: new charts.ArcRendererConfig(
                             arcWidth: 120,
                             arcRendererDecorators: [
                               charts.ArcLabelDecorator(
                                 labelPosition: charts.ArcLabelPosition.inside,
                               ),
                             ]
                           ),
                         ),
                       ),
                     ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  String task;
  double taskValue;
  Color colorVal;

  Task(this.task, this.taskValue, this.colorVal);
}
