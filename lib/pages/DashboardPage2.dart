import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/myAppBarMenu.dart';
import 'package:flutterstaggeredgridontap/pages/myCharts.dart';
import 'package:flutterstaggeredgridontap/pages/portfolio/PortfolioPage.dart';

class DashboardPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      drawer: MyAppBarMenu(),
      appBar: new AppBar(

//        MyAppBarMenu(),
//        centerTitle: true,

        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
//        MyAppBarMenu(),
      ),

//      drawer:
//      DrawerHeader(
//          MyAppBarMenu()),

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PortfolioPage()));
//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutMePage()));
        },
//          Navigator.push(context,"/PortfolioPage");
//          Navigator.pop(context, true);
//          Navigator.pushNamed(context, "/CryptoPage");
//          Navigator.pop(context, true);
//          Navigator.pushReplacementNamed(context, "/StocksPage");
//          Navigator.pop(context, true);
//          Navigator.pushReplacementNamed(context, "/SettingsPage");
//          Navigator.pop(context, true);
//          Navigator.pushReplacementNamed(context, "/ReportPage");
//          Navigator.pop(context, true);
//          Navigator.pushReplacementNamed(context, "/CryptoPage");
//          Navigator.pop(context, true);


        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  iconData,
                  color: Colors.white,
                  size: 30.0,
                ),
                Text(
                  header,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
