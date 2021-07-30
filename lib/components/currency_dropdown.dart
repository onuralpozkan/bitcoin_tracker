import 'package:flutter/material.dart';

List<String> currencies = ['USD', 'EUR', 'TRY', 'CAD'];

List<DropdownMenuItem<String>> currencyDropdown() {
  List<DropdownMenuItem<String>> dropdownItems = [];
  dropdownItems = currencies
      .map((e) => (DropdownMenuItem(
            child: Text(e),
            value: e,
          )))
      .toList();
  return dropdownItems;
}
