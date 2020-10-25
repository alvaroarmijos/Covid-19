import 'package:covid19/constant.dart';
import 'package:covid19/info_screem.dart';
import 'package:covid19/service/covid_service.dart';
import 'package:covid19/widgets/counter.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new CovidServices(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor)
          )
        ),
        home: HomeScreen(),

      ),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {

    final covid = Provider.of<CovidServices>(context).covidListo;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Quédate",
              textBotton: "en casa",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                )
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20,),
                  Expanded(child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: "Loja",
                    items: ["Loja"].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (value){},))
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Casos actualizados\n",
                                style: kTitleTextstyle
                            ),
                            TextSpan(
                              text: covid.fecha,
                              style: TextStyle(
                                color: kTextLightColor
                              )
                            )

                          ]
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: _launchURL,
                        child: Text(
                          "Mirar detalles",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: covid.confirmados,
                          title: "Confirmados",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: covid.muertes,
                          title: "Muertes",
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: covid.recuperados,
                          title: "Recuperados",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20.0),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(28),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor
                          )
                        ]
                    ),
                    child: Image.asset(
                      "assets/images/mapa-loja.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

_launchURL() async {
  var url = 'https://www.gestionderiesgos.gob.ec/informes-de-situacion-covid-19-desde-el-13-de-marzo-del-2020/';
  if (await canLaunch(url)) {
    await launch(url);
  }
}




