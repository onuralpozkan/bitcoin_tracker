import 'package:bitcoin_tracker/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'dart:convert';

class FetchData {
  Future<dynamic> getAll(String currency) async {
    var btcUrl = Uri.parse('$kBaseUrl/BTC/$currency/?apikey=$kApiKey');
    var ethUrl = Uri.parse('$kBaseUrl/ETH/$currency/?apikey=$kApiKey');
    var ltcUrl = Uri.parse('$kBaseUrl/LTC/$currency/?apikey=$kApiKey');
    Map coins = {};
    try {
      http.Response btcData = await http.get(btcUrl);
      http.Response ethData = await http.get(ethUrl);
      http.Response ltcData = await http.get(ltcUrl);
      var btcRate = jsonDecode(btcData.body);
      var ethRate = jsonDecode(ethData.body);
      var ltcRate = jsonDecode(ltcData.body);
      coins = {'btcRate':btcRate, 'ethRate':ethRate, 'ltcRate':ltcRate};

      return coins;
    } catch (e) {
      print(e);
    }    
  }
}
