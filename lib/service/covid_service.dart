import 'dart:convert';

import 'package:covid19/models/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _url = "https://covid-19-94d67.firebaseio.com";

class CovidServices with ChangeNotifier{

  Covid covidListo = new Covid();

  Covid get getCovidServices => this.covidListo;

  CovidServices(){
    this.getCovid();
  }

  getCovid() async{

    final url = '$_url/ciudad/Loja.json';
    final resp = await http.get(url);

    /*final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null){
      return [];
    }

    decodedData.forEach((id, covid){
      final covidTemp = Covid.fromJson(covid);
      covidTemp.id = id;
      covidListo=covidTemp;
    });*/

    covidListo = covidFromJson(resp.body);

    notifyListeners();
  }

}