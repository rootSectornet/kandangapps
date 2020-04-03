import 'package:flutter/material.dart';

Widget submitButton(T, String title) => StreamBuilder<bool>(
      stream: T.submitValid,
      builder: (context, snap) {
        return InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50.0,
            margin: const EdgeInsets.only(top: 50.0),
            padding: const EdgeInsets.only(
                top: 4.0, left: 16.0, right: 16.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Color(0xFFFF0054),
            ),
            child: Center(
              child: Text(
                title.toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: (!snap.hasData) ? null : T.submit,
        );
      },
    );
