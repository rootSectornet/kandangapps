import 'package:flutter/material.dart';
import 'package:kandangapp/src/blocs/login_bloc.dart';

Widget passwordField(T) => StreamBuilder<String>(
      stream: T.password,
      builder: (context, snap) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 55.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color(0xFFECEDF1),
                // boxShadow: [
                //   BoxShadow(color: Colors.black12, blurRadius: 5.0)
                // ]
              ),
              child: Center(
                child: TextField(
                  obscureText: true,
                  onChanged: T.changePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    // errorText: snap.error
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 5.0),
              child: Text(
                snap.error != null ? snap.error.toString() : "",
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
            )
          ],
        );
      },
    );
