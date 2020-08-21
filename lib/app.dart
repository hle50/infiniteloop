import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AdManager.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int transTime = 60;
  var data = [
    "Live as if you were to die tomorrow. Learn as if you were to live forever",
    "We must not allow other people’s limited perceptions to define us."
        "Do what you can, with what you have, where you are.",
    "Be yourself; everyone else is already taken.",
    "This above all: to thine own self be true.",
    "If you cannot do great things, do small things in a great way.",
    "If opportunity doesn\'t knock, build a door.",
    "Wise men speak because they have something to say; fools because they have to say something",
    "Strive not to be a success, but rather to be of value",
    "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.",
    "Whenever you find yourself on the side of the majority, it is time to pause and reflect.",
    "Either you run the day, or the day runs you.",
    "You must be the change you wish to see in the world.",
    "What you do speaks so loudly that I cannot hear what you say",
    "Believe and act as if it were impossible to fail.",
    "If you\'re not hopeful and optimistic, then you just give up. You have to take the long hard look and just believe that if you're consistent, you will succeed."
  ];
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['money', 'love', 'book', 'cellphone', 'game', 'pc'],
    childDirected: false,

  );
  BannerAd myBanner;
  initBanner(){
    myBanner = BannerAd(
        // Replace the testAdUnitId with an ad unit id from the AdMob dash.
        // https://developers.google.com/admob/android/test-ads
        // https://developers.google.com/admob/ios/test-ads
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.fullBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
    );
  }

loadBanner(){
  myBanner
  // typically this happens well before the ad is shown
    ..load()
    ..show(
      // Positions the banner ad 60 pixels from the bottom of the screen
      anchorOffset: 60.0,
      // Positions the banner ad 10 pixels from the center of the screen to the right
      horizontalCenterOffset: 10.0,
      // Banner Position
      anchorType: AnchorType.bottom,
    );
}
  @override
  void initState() {
    super.initState();
    initBanner();
    loadBanner();
  }

  onPageChange(int index, CarouselPageChangedReason reason){
    // load adds herer
    myBanner?.dispose();
    initBanner();
    loadBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be Happy and Enjoy the quotes'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: transTime.toString()),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  transTime = text as int;
                });
              },
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/3,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: transTime),
                onPageChanged: onPageChange,
              ),
              items: data.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                i,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
