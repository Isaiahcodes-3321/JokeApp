import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  @override
  initState() {
    super.initState();
    loadAd();
  }

  BannerAd? bannerAd;
  bool isLoaded = false;
  var adUnit = "ca-app-pub-3940256099942544/6300978111";

  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: adUnit,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? SizedBox(
            width: bannerAd!.size.width.toDouble(),
            height: bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: bannerAd!),
          )
        : const SizedBox();
  }
}

class FullAds extends StatefulWidget {
  const FullAds({Key? key}) : super(key: key);

  @override
  _FullAdsState createState() => _FullAdsState();
}

class _FullAdsState extends State<FullAds> {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;
  final adUnit = "ca-app-pub-3940256099942544/1033173712";

  void loadAd() {
    InterstitialAd.load(
      adUnitId: adUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          interstitialAd = ad;
          setState(() {
            isLoaded = true;
          });
          showInterstitialAd();
        },
        onAdFailedToLoad: (err) {
          debugPrint('InterstitialAd failed to load: $err');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (isLoaded) {
      interstitialAd?.show();
    } else {
      debugPrint('InterstitialAd not loaded yet.');
    }
  }

  @override
  void initState() {
    super.initState();
    showInterstitialAd();
    loadAd();
  }

  // @override
  // void dispose() {
  //   interstitialAd?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
