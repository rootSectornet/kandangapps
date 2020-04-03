import 'package:flutter/material.dart';
import 'package:kandangapp/src/resources/themes/app_theme.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const ErrorPage({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset(
            //   'assets/images/error_page.png',
            //   height: 300,
            // ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 3),
            RaisedButton(
              padding: EdgeInsets.all(0.0),
              color: pink,
              child: Text('Retry', style: TextStyle(color: Colors.white)),
              onPressed: onRetryPressed,
            )
          ],
        ),
      ),
    );
  }
}
