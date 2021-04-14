import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final imageUrl = 'assets/images/perfil.jpg';

  final darkBlue = Color.fromARGB(255, 18, 32, 47);
  final pinkAccentA200 = Colors.pinkAccent.shade200;
  final linkedInColor = Color.fromARGB(255, 40, 103, 178);
  final facebookColor = Color.fromARGB(255, 66, 103, 178);
  final emailColor = Color.fromARGB(255, 40, 103, 178);

  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text('MiCard'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: pinkAccentA200,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
              SizedBox(
                height: 24,
                width: double.infinity,
              ),
              Text(
                'Vanessa Gomes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Devonshire',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                child: Divider(
                  height: 10,
                  color: pinkAccentA200,
                  thickness: 2,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 26,
              ),
              Card(
                color: pinkAccentA200,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                elevation: 8,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.github),
                  title: Text('Meu Portfólio no GitHub'),
                  onTap: () {
                    //Chamada de funcção de abertura de pagina web pelo otque no ListTile
                    _launchInWebView('https://github.com/vanessa7-gomes');
                  },
                ),
              ),
              Card(
                color: linkedInColor,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                elevation: 8,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.linkedin),
                  title: Text('LinkeIn'),
                  onTap: () {
                    _launchInWebView(
                        'https://www.linkedin.com/in/vanessa-ribeiro-gomes-946a98169/');
                  },
                ),
              ),
              Card(
                color: emailColor,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                elevation: 8,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.envelope),
                  title: Text('Email'),
                  onTap: () {
                    _launchInWebView('https://outlook.live.com/owa/');
                  },
                ),
              ),
              Card(
                color: facebookColor,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                elevation: 8,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.facebook),
                  title: Text('Facebook'),
                  onTap: () {
                    _launchInWebView(
                        'https://www.facebook.com/vanessa.ribeirogomes.9');
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Like'),
          icon: Icon(FontAwesomeIcons.facebook),
        ),
      ),
    );
  }
}
