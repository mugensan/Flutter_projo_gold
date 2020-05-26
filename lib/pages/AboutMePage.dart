import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link/link.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: new AppBar(
          title: new Text('About Me'),
          centerTitle: true,

          ///this target transition between android and IOS
          elevation:
              debugDefaultTargetPlatformOverride == TargetPlatform.android
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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/mugenThinker.png'),
              ),
              Text(
                "Kevin Roditi",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "MOBILE DEVELOPER",
                style: TextStyle(
                  fontFamily: "Source",
                  fontSize: 20.0,
                  color: Colors.grey[500],
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 40.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[50],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 20.0,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    "+41 123 45 67 89",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "Pacifico",
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 20.0,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    "krodi001@gold.ac.uk",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "Pacifico",
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 25.0,
                ),
                child: Link(
                    url: 'https://github.com/mugensan',

                    child: ListTile(
                      leading: Icon(
                        Icons.apps,
                        size: 20.0,
                        color: Colors.teal.shade900,
                      ),
                      title: Text(
                        "github.com/mugensan",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "Pacifico",
                          fontSize: 20.0,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
