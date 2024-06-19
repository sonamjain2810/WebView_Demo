import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'data/Strings.dart';
import 'utils/SizeConfig.dart';
import 'HomePage.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //\nUrl: ${AppUrl()}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 19 * SizeConfig.widthMultiplier,
                backgroundImage: const NetworkImage(
                    'https://pbs.twimg.com/profile_images/1158115409993691138/wABb5ZLe_400x400.jpg'),
                backgroundColor: Theme.of(context).primaryIconTheme.color,
              ),
              accountName: const Text(Strings.accountName),
              accountEmail: const Text(Strings.accountEmail),
            ),
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.home,
                          color: Theme.of(context).primaryIconTheme.color),
                      title:  Text("Home Page",style: Theme.of(context).textTheme.titleSmall,),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryIconTheme.color),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomePage()));
                      }),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.format_quote,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Quotes",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuotesList()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.image,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Images",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ImagesList()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.info,
                        color: Theme.of(context).primaryIconTheme.color),
                    title: Text("About Developer",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      //interstitialTag = "about";
                      Navigator.of(context).pop();

                      //_interstitialAd.isLoaded() != null
                      //  ? _interstitialAd?.show()
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.feedback,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Submit Feedback",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () async {
                      Navigator.of(context).pop();
                      debugPrint("Feedback Button Clicked");

                      if (await canLaunchUrlString(Strings.mailContent)) {
                        await launchUrlString(Strings.mailContent);
                      } else {
                        throw 'Could not launch $Strings.mailContent';
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.more,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Other Apps",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      debugPrint("More Button Clicked");
                      launchUrlString(Strings.accountUrl);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.rate_review,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Rate This App",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () {
                      Navigator.of(context).pop();
                      //launch(Strings.appUrl);
                      Strings.RateNReview();
                    },
                  ),
                  const Divider(),
                  ListTile(
                      leading: Icon(Icons.share,
                          color: Theme.of(context).primaryIconTheme.color),
                      title:  Text("Share App",style: Theme.of(context).textTheme.titleSmall,),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryIconTheme.color),
                      onTap: () {
                        debugPrint("Share Button Clicked");
                        Navigator.of(context).pop();
                        final RenderBox box =
                            context.findRenderObject() as RenderBox;
                        Share.share(
                          Strings.shareAppText,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size,
                        );
                      }),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.close,
                        color: Theme.of(context).primaryIconTheme.color),
                    title:  Text("Close",style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
