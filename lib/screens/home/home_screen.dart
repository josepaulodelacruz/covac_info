import 'dart:async';
import 'package:covac_information/services/AdmobServices.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState () => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  MobileAdTargetingInfo targetingInfo;
  BannerAd myBanner;
  ConfettiController _controllerCenter;
  bool play = false;
  bool vaccinated = false;
  bool disposed = false;
  Timer timer;

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: AdmobServices.banner(),
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if(event == MobileAdEvent.loaded) {
            if(disposed) {
              myBanner.dispose();
            } else {
              myBanner..show(
                  anchorType: AnchorType.bottom,
                  anchorOffset: MediaQuery.of(context).size.height * 0.12
              );
            }
          }
        }
    );
  }

  @override
  void initState () {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    FirebaseAdMob.instance.initialize(appId: AdmobServices.appId());
    myBanner =  buildBannerAd()..load();
  }

  void displayBanner() async {
    disposed = false;
    if(myBanner == null) myBanner = buildBannerAd();
    myBanner.load();
  }

  void hideBanner() async {
    await myBanner?.dispose();
    disposed = true;
    myBanner = null;
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    timer.cancel();
    myBanner?.dispose();
    hideBanner();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: Stack(
        children: [
          !vaccinated ?
            Center(
              child: FlareActor(
                'assets/syringe.flr',
                animation: play ? 'Inject' : null,
              ),
            ) : Align(
            alignment: Alignment.center,
            child: Text(
              'Congratulation You Are now Vaccinated from Covid',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(fontSize: 32)
              )
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
              true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
        ],
      ),
      floatingActionButton: !vaccinated ? FloatingActionButton(
        onPressed: () {
          hideBanner();
          setState(() {
            play = true;
            timer = Timer.periodic(Duration(seconds: 8), (timer) {
              setState(() {
                vaccinated = true;
              });
              _controllerCenter.play();
            });
          });


        },
        child: Text('Inject', style: TextStyle(color: Colors.white))
      ) : null,
    );
  }
}