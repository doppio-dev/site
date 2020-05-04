import 'package:doppio_dev_site/service/context_service.dart';
import 'package:doppio_dev_site/service/translate_service.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Meows extends StatelessWidget {
  const Meows({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = 'https://meows.app';
        if (await canLaunch(url)) {
          await launch(url);
        }
      },
      child: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: <double>[0.1, 0.5, 0.7, 0.9],
            colors: <Color>[
              // Colors are easy thanks to Flutter's Colors class.
              Color.fromARGB(255, 232, 95, 141),
              Color.fromARGB(255, 163, 115, 214),
              Color.fromARGB(255, 112, 154, 240),
              Color.fromARGB(255, 48, 222, 249)
              // Colors.indigo[600],
              // Colors.indigo[400],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      'assets/images/meows.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meows.app',
                      style: ContextService().textTheme.headline3,
                    ),
                    Text(
                      TranslateService().locale.home_meows_desc,
                      style: ContextService().textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
