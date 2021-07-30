import 'package:flutter/material.dart';
import '../utils/constants.dart';

Widget getCoinBox({String coin, String currency,String coinName}){
  
return Expanded(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: kMainPadding, vertical: kMainPadding/2),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: kBoxColor),
      child: Text(
          '1 $coinName: ${coin != null ? coin : 'Choose...'} ${currency == null ? 'Currency' : currency} '),
      onPressed: () {},
    ),
  ),
  flex: 1,
);
} 