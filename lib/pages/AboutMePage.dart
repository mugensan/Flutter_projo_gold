import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('About Me'),
        centerTitle: true,
        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,

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

      body: Container(

      ),
    );
  }
}
