import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.openLink(url: 'https://youtube.com');
  }
}

class Utils {
  static Future openLink({
    @required String url,
  }) =>
      _launchUrl(url);
  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

// class RatingPage extends StatefulWidget {
//   @override
//   _RatingPageState createState() => _RatingPageState();
// }

// class _RatingPageState extends State<RatingPage> {
//   RateMyApp _rateMyApp = RateMyApp(
//     preferencesPrefix: 'rateMyApp_',
//     minDays: 3,
//     minLaunches: 7,
//     remindDays: 2,
//     remindLaunches: 5,
//     // googlePlayIdentifier: 'com.google.chrome',
//   );

//   @override
//   void initState() {
//     super.initState();
//     _rateMyApp.init().then((_) {
//       // if (_rateMyApp.shouldOpenDialog) {
//       _rateMyApp.showStarRateDialog(
//         context,
//         title: 'Enjoying Flutter Rating App?',
//         message: 'Please leave a rating!',
//         onRatingChanged: (stars) {
//           return [
//             TextButton(
//               child: Text('Ok'),
//               onPressed: () {
//                 if (stars != null) {
//                   _rateMyApp.doNotOpenAgain = true;
//                   _rateMyApp.save().then((v) => Navigator.pop(context));
//                 } else {
//                   Navigator.pop(context);
//                 }
//               },
//             )
//           ];
//         },
//         dialogStyle: DialogStyle(
//           titleAlign: TextAlign.center,
//           messageAlign: TextAlign.center,
//           messagePadding: EdgeInsets.only(bottom: 20.0),
//         ),
//         starRatingOptions: StarRatingOptions(),
//       );
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
