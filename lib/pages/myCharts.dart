import 'dart:convert';
import 'dart:ui';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutterstaggeredgridontap/pages/portfolio/appBar.dart';
import 'package:flutterstaggeredgridontap/pages/portfolio/myFlexibleAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

class MyCharts extends StatefulWidget {
  @override
  _MyChartsState createState() => _MyChartsState();
}

class _MyChartsState extends State<MyCharts> {
  final String url =
      "https://my.api.mockaroo.com/stocks_data.json?key=cbcf98d0";

  List data;

  List sampleDataMACD = [
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
  ];

  List<double> data1 = [1.0, 2.0, 3.0, 2.0, 1.0, 5.6, 2.0, 3.0, 6.0, 4.0, 1.0];
  List<double> data2 = [0.8, 0.7, 1.0, 0.9, 0.2, 1.3, 1.6, 0.8, 0.3, 0.0];
  List<double> data3 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.2, 1.3, 1.4];
  List<double> data4 = [0.4, 0.5, 0.6, 1.0, 1.0, 0.9, 0.6, 0.5];
  List<double> data5 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.3, 0.8, 1, 2];
  List<double> data6 = [0.8, 0.9, 0.7, 0.6, 0.8, 0.9];
  List<double> data7 = [0.2, 0.3, 0.6, 1.0, 0.6, 0.3, 0.2];
  List<double> data8 = [1.0, 1.1, 1.2, 1.3, 1.4, 1.2, 1.3];
  List<double> data9 = [1.0, 1.1, 1.0, 0.9, 1.2, 1.3, 1.0, 0.8, 1.3, 1.0];

  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<EarningsPerYear, double>> _seriesLineData;

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

    var earningsPerYear = [
      new EarningsPerYear(0, 0),
      new EarningsPerYear(1, 197.79),
      new EarningsPerYear(2, 139.0),
      new EarningsPerYear(3, 397.79),
      new EarningsPerYear(4, 155.0),
      new EarningsPerYear(5, 597.79),
    ];

    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskValue,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorVal),
      id: 'My Cryptos',
      labelAccessorFn: (Task row, _) => '${row.taskValue}',
    ));

    _seriesLineData.add(
      charts.Series(
          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.tealAccent),
          id: 'MACD Indicator',
          data: earningsPerYear,
          domainFn: (EarningsPerYear macd, _) => macd.years,
          measureFn: (EarningsPerYear macd, _) => macd.earnings),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<EarningsPerYear, double>>();
    _generateData();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(

        ///encoding url
        Uri.encodeFull(url),

        ///only accept json response
        headers: {"Accept": "application/json"});

    ///test: this line will not be executed until we get a response
//    print(response.body);

    ///if response modify state of our widget
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;

      ///need to extract data
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: new AppBar(
            title: new Text('My Crypto Portfolio'),
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
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
//                Tab(
//                  icon: Icon(FontAwesomeIcons.candyCane)
//                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.moneyBillWave),
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
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 3),
                          behaviors: [
                            new charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 3,
                                cellPadding: new EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                  color: charts
                                      .MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11,
                                )),
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 120,
                            arcRendererDecorators: [
                              charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside,
                              ),
                            ],
                          ),
                        ),
                      ),
                      
//                      Container(
//                        child: Expanded(
//                          child: new OHLCVGraph(
//                            data: sampleDataMACD,
//                            enableGridLines: true,
//                            volumeProp: 0.2,
//                            gridLineAmount: 5,
//                            gridLineColor: Colors.grey[300],
//                            gridLineLabelColor: Colors.grey,
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Earnings of my portfolio',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: new OHLCVGraph(
                            data: sampleDataMACD,
                            enableGridLines: true,
                            volumeProp: 0.2,
                            gridLineAmount: 5,
                            gridLineColor: Colors.grey[300],
                            gridLineLabelColor: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                              includeArea: true,
                              stacked: true,
                            ),
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            behaviors: [
                              new charts.ChartTitle("Years",
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle("My portfolio",
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
//              Container(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            myCardDetails("assets/bitcoin.png", "Bitcoin",
                                data1, "", "3.0", "\u2191", 0xff07862b),
                            myCardDetails("assets/bitshares.png", "Bitshares",
                                data2, "", "4.0", "\u2193", 0xff07862b),
                            myCardDetails("assets/ethereum.png", "Ethereum",
                                data3, "", "5.0", "\u2191", 0xff07862b),
                            myCardDetails(
                                "assets/counterparty.png",
                                "Counterpaty",
                                data7,
                                "",
                                "3.0",
                                "\u2193",
                                0xff07862b),
                            myCardDetails("assets/lykke.png", "Lykke", data5,
                                "", "2.0", "\u2191", 0xff07862b),
                            myCardDetails("assets/peercoin.png", "Peercoin",
                                data6, "", "2.5", "\u2191", 0xff07862b),
                            myCardDetails("assets/zcash.png", "Zcash", data4,
                                "", "2.0", "\u2193", 0xff07862b),
                            myCardDetails("assets/singular.png", "Singular",
                                data8, "", "2.5", "\u2191", 0xff07862b),
                            myCardDetails("assets/litecoin.png", "Litecoin",
                                data9, "", "3.0", "\u2193", 0xff07862b),

//                          Container(
//                            padding: const EdgeInsets.only(
//                                left: 8.0, bottom: 8.0),
//                          ),
//                          new Card(
//                            child: myCardDetails(
//                                "assets/bitcoin.png",
//                                "Bitcoin",
//                                data1,
//                                "4702",
//                                "3.0",
//                                "\u2191",
//                                0xff07862b),
//                          ),
                          ],
                        ),
//                      );
//                    }),
//              ),
//            ],
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

class EarningsPerYear {
  double years;
  double earnings;

  EarningsPerYear(
    this.years,
    this.earnings,
  );
}


Widget myCardDetails(
    String imageVal,
    String currencyName,
    List<double> data,
    String currencyVal,
    String currencyPercentage,
    String currencyStatus,
    int colorVal) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: myCurrencies(imageVal, currencyName, data, currencyVal,
            currencyPercentage, currencyStatus, colorVal),
      ),
    ),
  );
}

Center myCurrencies(
    String imageVal,
    String currencyName,
    List<double> data,
    String currencyVal,
    String currencyPercentage,
    String currencyStatus,
    int colorVal) {
  return Center(
      child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          myLeadingDetails(imageVal, currencyName),
          myGraphDetails(data),
          myCurrenciesDetails(
              currencyVal, currencyPercentage, currencyStatus, colorVal),
        ],
      )
    ],
  ));
}

Widget myLeadingDetails(String imageVal, String currencyName) {
  return Container(
      child: Row(
    children: <Widget>[
      Container(
        child: Image(
          height: 50.0,
          image: AssetImage(imageVal),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Container(
        child: Text(
          currencyName,
          style: TextStyle(
              color: Color(0xff3a2483),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      ),
    ],
  ));
}

Widget myGraphDetails(List<double> data) {
  return Container(
    width: 80.0,
    height: 50.0,
    child: Sparkline(
      data: data,
      lineColor: Color(0xff013db7),
      fillMode: FillMode.below,
      fillColor: Colors.blue[100],
    ),
  );
}

Widget myCurrenciesDetails(String currencyVal, String currencyPercentage,
    String currencyStatus, int colorVal) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        child: Text("Own" + currencyVal,
            style: TextStyle(
                color: Color(0xff3a2483),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                fontSize: 20.0)),
      ),
      Container(
        child: Text(currencyPercentage,
            style: TextStyle(
              color: Color(colorVal),
              fontFamily: 'Poppins',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            )),
      ),
    ],
  ));
}
