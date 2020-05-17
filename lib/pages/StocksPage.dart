import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StocksPage extends StatefulWidget {
  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  final String url =
      "https://my.api.mockaroo.com/stocks_data.json?key=cbcf98d0";

  List data;

  @override
  void initState() {
    super.initState();
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StocksMock"),

        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
      ),

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
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Card(
                    child: Row(
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 8.0),

                            ),
                            Column(
//                                crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: new  Text(
                                    data[index]['company'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),

                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: new Text(data[index]['symbol'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new  Text("price  " + data[index]['price'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text("open  " + data[index]['open'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text("high  " + data[index]['high'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text("low  " + data[index]['low'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text("close  " + data[index]['close'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
//              child: new Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: Container(
//                        child: Material(
//                          color: Colors.white,
//                          elevation: 14.0,
//                          borderRadius: BorderRadius.circular(24.0),
//                          shadowColor: Color(0x802196F3),
//                          child: new Column(
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Column(
//                                    children: <Widget>[
//                                      Text(
//                                        data[index]['company'],
//                                        style: TextStyle(
//                                          fontSize: 14,
//                                          fontWeight: FontWeight.bold,
//                                          color: Colors.black,
//                                        ),
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text(data[index]['symbol'],
//                                            style: TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.w500,
//                                              color: Colors.grey,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//
//                                      Row(
//                                        children: <Widget>[
//                                          Text(data[index]['price'],
//                                            style: TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.w500,
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ), Row(
//                                        children: <Widget>[
//                                          Text(data[index]['open'],
//                                            style: TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.w500,
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ), Row(
//                                        children: <Widget>[
//                                          Text(data[index]['high'],
//                                            style: TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.w500,
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ), Text(data[index]['low'],
//                                        style: TextStyle(
//                                          fontSize: 12,
//                                          fontWeight: FontWeight.w500,
//                                          color: Colors.black,
//                                        ),
//                                      ), Row(
//                                        children: <Widget>[
//                                          Text(data[index]['close'],
//                                            style: TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.w500,
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
//                                ],
//                              )
//                            ],
////                            children: <Widget>[
////                              Text(
////                                 data[index]['symbol'],
////
//                          ),
//                        )),
//                  ),
//                ],
//              ),
            );
          }),
    );
  }
}