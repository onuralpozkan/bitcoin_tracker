import 'package:bitcoin_tracker/components/currency_dropdown.dart';
import 'package:flutter/material.dart';
import '../components/appbar_title.dart';
import '../utils/constants.dart';
import '../services/fetch_data.dart';
import '../components/coin_box.dart';

AppbarTitle customTitle = AppbarTitle(
    imgUrl: 'assets/images/icons/bitcoin.svg', label: 'Bitcoin Tracker App');
String currencyValue;
FetchData getAllCoinRates = FetchData();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currBTC;
  String currETH;
  String currLTC;
  
  void updateUI(String currency) async {
    var rates = await getAllCoinRates.getAll(currency);
    setState(() {
      currencyValue = currency;
      currBTC = rates['btcRate']['rate'].toStringAsFixed(2);
      currETH = rates['ethRate']['rate'].toStringAsFixed(2);
      currLTC = rates['ltcRate']['rate'].toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTitle.getAppbarTitle(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30.0,
            ),
            getCoinBox(coin: currBTC, currency: currencyValue, coinName: 'BTC'),
            getCoinBox(coin: currETH, currency: currencyValue, coinName: 'ETH'),
            getCoinBox(coin: currLTC, currency: currencyValue, coinName: 'LTC'),
            SizedBox(
              height: 300,
            ),
            Expanded(
              child: Container(
                  color: kPrimaryColor,
                  child: Center(
                    child: DropdownButton(
                        value: currencyValue,
                        hint: Text('Currency'),
                        onChanged: (e) {
                          updateUI(e);
                        },
                        items: currencyDropdown(),),
                  )),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
