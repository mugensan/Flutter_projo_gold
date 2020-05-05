import 'package:flutter/material.dart';

class CoinMarket{
  final String id;
  final String name;
  final String symbol;
  final String price_usd;
  final String percent_change_1h;
  final String percent_change_24h;
  final String percent_change_7d;

  CoinMarket({this.id, this.name, this.symbol, this.price_usd,
      this.percent_change_1h, this.percent_change_24h, this.percent_change_7d});



//
  factory CoinMarket.fromJson(Map<String,dynamic>json){
    return CoinMarket(
      id:json['id'],
      name:json['data']['name'],
      symbol:json['symbol'],
      price_usd:json['price_usd'],
      percent_change_1h:json['percent_change_1h'],
      percent_change_24h:json['percent_change_24h'],
      percent_change_7d:json['percent_change_7d'],

    );
  }
}