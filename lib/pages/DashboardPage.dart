import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterstaggeredgridontap/pages/PortfolioPage.dart';
import 'CryptoPage.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DashboardPage'),
        centerTitle: true,

        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
      ),
//body: Drawer(),


      /**
       * ##################################################################
       */

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
              title: new Text("Crypto"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/CryptoPage");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Stock"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/StocksPage");
              },
            ),
            new Divider(),
            new ListTile(

              title: new Text("Portfolio"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/PortfolioPage");
              },

              ///TODO ADD ROUTE
            ),
            new Divider(),
            new ListTile(
              title: new Text("About me"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/AboutMePage");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Report"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/ReportPage");
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

      /**
       * ##################################################################
       */
      body: Center(
        child: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            )),
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile(this.backgroundColor, this.header, this.iconData);

  final Color backgroundColor; // = Color.alphaBlend(Colors.green, Colors.red);
  final IconData iconData;
  final String header;

  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      color: backgroundColor,

      child: new InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/PortfolioPage");
        },
      ),
    );
//          Navigator.pop(context,true);


//
//          Navigator.pop(context,true);
//          Navigator.pushReplacementNamed(context, "/PortfolioPage");
//          Navigator.pushNamed(context, "/CryptoPage");
//          Navigator.pushReplacementNamed(context, "/StocksPage");
//          Navigator.pushReplacementNamed(context, "/SettingsPage");
//          Navigator.pushReplacementNamed(context, "/ReportPage");
//          Navigator.pushReplacementNamed(context, "/CryptoPage");
  }

  ,

  child

      :

  new

  Center

  (

  child

      :

  new

  Padding

  (

  padding

      :

  const EdgeInsets.all

  (

  8.0

  )

  ,

  child

      :

  Column

  (

  mainAxisAlignment

      :

  MainAxisAlignment.center

  ,

  children

      :

  <

  Widget

  >

  [

  new

  Icon

  (

  iconData

  ,

  color

      :

  Colors.white

  ,

  size

      :

  30.0

  ,

  )

  ,

  Text

  (

  header

  ,

  style

      :

  TextStyle

  (

  color

      :

  Colors.white

  ,

  fontSize

      : 20.0,
  ),),
  ],
  ),
  )

  ,

  )

  ,

  )

  ,

  );
}}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.extent(2, 130.0),
  const StaggeredTile.extent(1, 150.0),
  const StaggeredTile.extent(1, 150.0),
  const StaggeredTile.extent(1, 150.0),
  const StaggeredTile.extent(1, 150.0),
  const StaggeredTile.extent(2, 210.0),
];

List<Widget> _tiles = const <Widget>[
  const _DashboardTile(Color(0xffed622b), "Portfolio", Icons.account_balance),
  const _DashboardTile(Color(0xff26cb3c), "Crypto", Icons.attach_money),
  const _DashboardTile(Color(0xffff3266), "Stocks", Icons.insert_chart),
  const _DashboardTile(Color(0xfff4c83f), "Settings", Icons.settings),
  const _DashboardTile(Color(0xff7297ff), "About Me", Icons.book),
  const _DashboardTile(Color(0xff622F74), "Report", Icons.menu),
];
