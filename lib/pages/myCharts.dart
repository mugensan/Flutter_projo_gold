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

class MyCharts extends StatefulWidget {
  @override
  _MyChartsState createState() => _MyChartsState();
}

class _MyChartsState extends State<MyCharts> {
  final String url =
      "https://my.api.mockaroo.com/stocks_data.json?key=cbcf98d0";

  List data;

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
  List<charts.Series<Macd, double>> _seriesLineData;

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

    var macdVersatis = [
      new Macd(138.12, 197.79),
      new Macd(197.79, 139.0),
      new Macd(287.79, 397.79),
      new Macd(397.79, 55.0),
      new Macd(497.79, 597.79),
      new Macd(597.79, 333.0),
    ];
//    var macdMac = [
//      new Macd(118.12, 97.79),
//      new Macd(227.79, 39.0),
//      new Macd(337.79, 97.79),
//      new Macd(447.79, 5.0),
//      new Macd(557.79, 97.79),
//      new Macd(667.79, 33.0),
//];

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
          data: macdVersatis,
          domainFn: (Macd macd, _) => macd.open,
          measureFn: (Macd macd, _) => macd.close),
    );

//    _seriesLineData.add(
//      charts.Series(
//          colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.black12),
//          id: 'MACD Indicator',
//          data: macdMac,
//          domainFn: (Macd macd, _) => macd.open,
//          measureFn: (Macd macd, _) => macd.close),
//    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Macd, double>>();
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.blue[200],
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
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
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
                          'Stocks Macd',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
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
                              new charts.ChartTitle("open",
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              new charts.ChartTitle("close",
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
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Stocks Macd',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomScrollView(
                            slivers: <Widget>[
//                              SliverAppBar(
//                                title: MyAppBar(),
//                                pinned: true,
//                                expandedHeight: 210.0,
//                                flexibleSpace: FlexibleSpaceBar(
//                                  background: MyFlexibleAppBar(),
//                                ),
//                              ),
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  <Widget>[
                                    myCardDetails(
                                        "assets/bitcoin.png",
                                        "Bitcoin",
                                        data1,
                                        "4702",
                                        "3.0",
                                        "\u2191",
                                        0xff07862b),
                                    myCardDetails(
                                        "assets/bitshares.png",
                                        "Bitshares",
                                        data2,
                                        "3802",
                                        "4.0",
                                        "\u2193",
                                        0xffff0000),
                                    myCardDetails(
                                        "assets/ethereum.png",
                                        "Ethereum",
                                        data3,
                                        "7702",
                                        "5.0",
                                        "\u2191",
                                        0xff07862b),
                                    myCardDetails(
                                        "assets/counterparty.png",
                                        "Counterpaty",
                                        data7,
                                        "4702",
                                        "3.0",
                                        "\u2193",
                                        0xffff0000),
                                    myCardDetails(
                                        "assets/lykke.png",
                                        "Lykke",
                                        data5,
                                        "8600",
                                        "2.0",
                                        "\u2191",
                                        0xff07862b),
                                    myCardDetails(
                                        "assets/peercoin.png",
                                        "Peercoin",
                                        data6,
                                        "4702",
                                        "2.5",
                                        "\u2191",
                                        0xff07862b),
                                    myCardDetails(
                                        "assets/zcash.png",
                                        "Zcash",
                                        data4,
                                        "2345",
                                        "2.0",
                                        "\u2193",
                                        0xffff0000),
                                    myCardDetails(
                                        "assets/singular.png",
                                        "Singular",
                                        data8,
                                        "3800",
                                        "2.5",
                                        "\u2191",
                                        0xffff0000),
                                    myCardDetails(
                                        "assets/litecoin.png",
                                        "Litecoin",
                                        data9,
                                        "2000",
                                        "3.0",
                                        "\u2193",
                                        0xffff0000),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

class Macd {
//  String stockName;
//  int yAxis;
//  double price;
  double open;

//  double high;
//  double low;
  double close;

  Macd(
    //      this.stockName,
//      this.yAxis,
//      this.price,
    this.open,
//      this.high,
//      this.low,
    this.close,
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
        child: Text("\u0024" + currencyVal,
            style: TextStyle(
                color: Color(0xff3a2483),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                fontSize: 20.0)),
      ),
      Container(
        child: Text(currencyPercentage + "\u0025\u0020" + currencyStatus,
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
