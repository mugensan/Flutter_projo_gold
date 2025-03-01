import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CryptoPage extends StatefulWidget {
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {


  final String url ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&&CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";

  List crypto_data;

//  List crypto_price;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{

    var response = await http.get(
      ///encoding url
        Uri.encodeFull(url),
        ///only accept json response
        headers: {"Accept":"application/json"}
    );

    ///test: this line will not be executed until we get a response
//    print(response.body);

    ///if response modify state of our widget
    setState(() {
      var convertDataToJson = json.decode(response.body);
      crypto_data = convertDataToJson['data'];
//      crypto_price = convertDataToJson['quote'];
      ///need to extract data
    });

    return "Success!";
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto"),
        centerTitle: true,
      ),
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

        itemCount: crypto_data == null ? 0 : crypto_data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0),
                      child:
                        Image.network("https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto_data[index]['id']}.png"),
                        width: 64.0,
                        height: 64.0,
                      ),
                    ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: new Text(crypto_data[index]['name']),
//                                  padding: const EdgeInsets.only(right: 5.0,bottom: 5.0,left: 50.0,top: 5.0),
                                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                                ),
                                Container(
                                  child: new Text(crypto_data[index]['symbol']),
                                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
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
                                  child: Text(r'$' + crypto_data[index]['quote']['USD']['price'].toString()),
                                ),
                                Container(

                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(crypto_data[index]['quote']['USD']['percent_change_1h'].toString()+r' %',style: TextStyle(color:getColor(crypto_data[index]['quote']['USD']['percent_change_1h'].toString()),),

                                )
                                )],

                            ),
                          ),
                        )

                          ],
                        ),

                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
//}

getColor(String percent) {
//    TODO fix bug -> turn neg double in color red
  if (percent.contains("-")) {
    return hexToColor('#FF000');
  } else {
    return hexToColor('#32CD32');
  }
}
  hexToColor(String color){
    return new Color(int.parse(color.substring(1,),radix: 16) + 0xFF000000);
  }
  }

//
//}
//}



//
//// ignore: non_constant_identifier_names
////final String api_key = "CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";
////final String url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?limit=10&&${api_key}";
//final String url ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?limit=10&&CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";
//Future<List<CoinMarket>> fetchListCoin() async {
//  final api_endpoint = await http.get(url);
////  print(api_endpoint);
//  //CHECKING THE STATUS IF OK PASS DATA IF ! THROW ERROR
//  if (api_endpoint.statusCode == 200) {
//    List coins = json.decode(api_endpoint.body);
//    return coins.map((coin) => new CoinMarket.fromJson(coin)).toList();
//
//  } else {
//    throw Exception('Not loading the coins!!! Problemo!!! ');
//  }
//}
//
//class CryptoPage extends StatefulWidget {
//  @override
//  _CryptoPageState createState() => _CryptoPageState();
//}
//
//class _CryptoPageState extends State<CryptoPage> {
//  //CREATING STORAGE LIST VARIABLE FOR THE DATA
//  var list;
//
//  //REFRESH PAGE ACTION
//  var refreshKey = GlobalKey<RefreshIndicatorState>();
//
//  @override
//  void initState() {
//    super.initState();
//    refreshListCoin();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Crypto",
//      theme: ThemeData.light(),
//      home: Scaffold(
//        appBar: AppBar(title: Text('Crypto')),
//        body: Center(
//          child: RefreshIndicator(
//            key: refreshKey,
//            child: FutureBuilder<List<CoinMarket>>(
//              future: list,
//              builder: (context, snapshot) {
//                if (snapshot.hasData) {
//                  List<CoinMarket> coins = snapshot.data;
//                  //DISPLAYING THE DATA IN THE VIEW
//                  return ListView(
//                    children: coins
//                        .map((coin) => Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Row(
//                                  children: <Widget>[
////                                    Column(
////                                      crossAxisAlignment:
////                                          CrossAxisAlignment.start,
////                                      children: <Widget>[
////                                        Container(
////                                          padding: const EdgeInsets.only(
////                                              left: 8.0, bottom: 8.0),
////                                          child: Image(
////                                            image: AssetImage(
////                                                'astro.png'),
////                                            width: 64.0,
////                                            height: 64.0,
////                                          ),
////                                        ),
////                                      ],
////                                    ),
//                                    Column(
//                                      crossAxisAlignment:
//                                      CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Container(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Text(coins['data']['name']),
//                                        )
//                                      ],
//                                    ),
//                                  ],
//                                )
//                              ],
//                            ))
//                        .toList(),
//                  );
//                } else if (snapshot.hasError) {
//                  Text("hahaha no coin list is loading${snapshot.error}");
//                }
//                return new CircularProgressIndicator();
//              },
//            ),
//            onRefresh: refreshListCoin,
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<Null> refreshListCoin() {
//    refreshKey.currentState?.show(atTop: false);
//
//    setState(() {
//      //ASSGNING THE DATA TO THE LIST
//      list = fetchListCoin();
//    });
//    return null;
//  }
//}
