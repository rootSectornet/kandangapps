import 'package:flutter/material.dart';
import 'package:kandangapp/models/kategori_response_model.dart';

class KandangContainer extends StatefulWidget {
  final List<CategoryModel> category;
  final String placeName;
  const KandangContainer({Key key, this.category, this.placeName})
      : super(key: key);

  @override
  _KandangContainerState createState() => _KandangContainerState();
}

class _KandangContainerState extends State<KandangContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Kandang ",
                      style:
                          TextStyle(color: Color(0xFF282B60), fontSize: 34.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.placeName,
                      style:
                          TextStyle(color: Color(0xFF282B60), fontSize: 34.0),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.grey[900],
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('Click notif');
                  },
                ),
              ],
            ),
          ),
        ),
        widget.category.length != 0
            ? Expanded(
                flex: 9,
                child: ListView.builder(
                    itemCount: widget.category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14.0, top: 8.0, bottom: 8.0),
                        child: Material(
                          elevation: 0.1,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x20000000),
                                        blurRadius: 5,
                                        offset: Offset(0, 3))
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Color(0x20000000),
                                                        blurRadius: 5,
                                                        offset: Offset(0, 3))
                                                  ],
                                                  // border: Border.all(color: Color(0xFFFF0054))
                                                ),
                                                child: widget
                                                        .category[index].images
                                                        .contains("http")
                                                    ? Image.network(
                                                        widget.category[index]
                                                            .images,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/goat1.jpg',
                                                        //fit: BoxFit.fill,
                                                        // height: 200,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  widget.category[index].title,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  widget
                                                      .category[index].subtitle,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black26),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Available",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12.0),
                                              child: Icon(
                                                Icons.videocam,
                                                color: Colors.black26,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12.0),
                                              child: Text(
                                                "LOT 1",
                                                style: TextStyle(
                                                    color: Colors.black26,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    }),
              )
            : Expanded(
                flex: 9,
                child: Center(
                  child: Text(
                    "Data not found",
                    style: TextStyle(color: Colors.grey, fontSize: 18.0),
                  ),
                ),
              )
      ],
    );
  }
}
