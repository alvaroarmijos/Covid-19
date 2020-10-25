import 'package:covid19/constant.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Conoce",
              textBotton: "el Covid-19",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Síntomas",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SintomaCard(
                        image: "assets/images/headache.png",
                        title: "Jaqueca",
                      ),
                      SintomaCard(
                        image: "assets/images/caugh.png",
                        title: "Tos",
                      ),
                      SintomaCard(
                        image: "assets/images/fever.png",
                        title: "Fiebre",
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Prevención", style: kTitleTextstyle,),
                  SizedBox(height: 20,),
                  PreventCard(
                    text: "La mascarilla es para proteger a las demás personas en caso de que usted esté infectado.",
                    title: "Usar mascarilla",
                    image: "assets/images/wear_mask.png",
                  ),
                  PreventCard(
                    text: "Lavarse las manos con un desinfectante a base de alcohol o con agua y jabón mata el virus si este está en sus manos.",
                    title: "Lavarse las manos",
                    image: "assets/images/wash_hands.png",
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PreventCard({
    Key key, this.image, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 160,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor
                  )
                ]
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15
                ),
                height: 140,
                width: MediaQuery.of(context).size.width -170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SintomaCard extends StatelessWidget {
  final String image;
  final String title;

  const SintomaCard({
    Key key, this.image, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
