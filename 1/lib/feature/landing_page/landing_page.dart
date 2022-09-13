import 'package:flutter/material.dart';
import 'package:traderstats_app/feature/landing_page/features_list.dart';
import 'package:traderstats_app/widgets/navigation_bar/navigation_bar.dart';
import '../../resources/strings.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0638),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [Navbar()], //Navbar goes here
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [_getHeadingOneForString(kAdvTradingStats), _getParagraphOneForString(kAim), _trialAndLearnBtns()]
                        .map((child) => Padding(padding: const EdgeInsets.all(12.0), child: child))
                        .toList(),
                  ),
                ),
                Image.asset(
                  'assets/images/landing_page/Scene_BlueGreenGold_Trading.png',
                  width: 200,
                  height: 200,
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/landing_page/Group_13120.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [_getHeadingOneForString(kTradingSolution), _getParagraphOneForString(kAim), _trialAndLearnBtns()]
                        .map((child) => Padding(padding: const EdgeInsets.all(12.0), child: child))
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 1400, child: Divider(thickness: 0.5, color: Color(0xffFFFFFF))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [_getHeadingTwoForString(kSpeedSuitable), const SizedBox(height: 10), _getParagraphTwoForString(kSpeedSuitablePara)],
                  ),
                  Column(
                    children: [
                      _getHeadingTwoForString(kSolanaAnalytics),
                      const SizedBox(height: 10),
                      _getParagraphTwoForString(kSolanaAnalyticsPara)
                    ],
                  ),
                  Column(
                    children: [_getHeadingTwoForString(kDeFiProtocol), const SizedBox(height: 10), _getParagraphTwoForString(kDeFiProtocolPara)],
                  )
                ]
                    .map((child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: SizedBox(width: 200, child: child),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: featuresList
                      .map((feature) => Card(
                            color: const Color(0xff282A47),
                            child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Image.asset(
                                    feature.imagePath,
                                    height: 75,
                                    width: 75,
                                  ),
                                  Text(feature.label, style: const TextStyle(color: Colors.white))
                                ]),
                              ),
                            ),
                          ))
                      .toList(),
                )),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }

  Text _getHeadingOneForString(String heading) {
    return Text(heading, maxLines: 2, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold));
  }

  Text _getHeadingTwoForString(String heading) {
    return Text(heading, maxLines: 2, style: const TextStyle(color: Colors.white, fontSize: 25));
  }

  Text _getParagraphOneForString(String paragraph) {
    return Text(paragraph, maxLines: 3, style: const TextStyle(color: Colors.white));
  }

  Text _getParagraphTwoForString(String paragraph) {
    return Text(paragraph, maxLines: 8, style: const TextStyle(color: Colors.white));
  }

  Text _aimParagraph() {
    return const Text(kAim, maxLines: 3, style: TextStyle(color: Colors.white));
  }

  Row _trialAndLearnBtns() {
    return Row(
      children: [trialBtn(), const SizedBox(width: 10), ElevatedButton(onPressed: () {}, child: const Text(kLearnMore))],
    );
  }

  ElevatedButton trialBtn() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12.0),
        ),
        child: const Text(kOneDayTrial));
  }

  ElevatedButton learnBtn() {
    return ElevatedButton(onPressed: () {}, child: const Text(kLearnMore));
  }
}
