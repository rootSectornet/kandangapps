import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomMaterialWidgetButton extends StatelessWidget {
  final VoidCallback onTaped;
  final String title;
  final IconData iconData;
  final bool isUseIcon;
  final String value;
  const CustomMaterialWidgetButton(
      {Key key, @required this.onTaped, this.title, this.iconData, this.isUseIcon, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.1,
      color: Colors.white,
      child: InkWell(
        onTap: onTaped,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              iconData,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              title,
                              // style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        isUseIcon ? 
                        Icon(
                          FontAwesomeIcons.arrowAltCircleRight,
                          color: Colors.grey,
                          size: 16.0,
                        ) : Text(
                              value,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w700
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}