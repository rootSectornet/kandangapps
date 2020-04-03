import 'package:flutter/material.dart';
import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/models/kategori_response_model.dart';
import 'package:kandangapp/src/blocs/kandang_bloc.dart';
import 'package:kandangapp/src/blocs/kategori_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/profile_skeleton.dart';

class AllKandangContainer extends StatefulWidget {
  final List<Kandang> kandang;
  final String placeName;

  const AllKandangContainer({Key key, this.kandang, this.placeName})
      : super(key: key);

  @override
  _AllKandangContainerState createState() => _AllKandangContainerState();
}

class _AllKandangContainerState extends State<AllKandangContainer> {
  KandangBloc _bloc = KandangBloc();
  CategoryBloc _categoryBloc;
  Kandang _placeSelected;
  @override
  void initState() {
    _categoryBloc = CategoryBloc();
    _bloc.fetchKandangList();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[    
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Kandang ",
                      style: TextStyle(color: Color(0xFF282B60), fontSize: 34.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Kami",
                      style: TextStyle(color: Color(0xFF282B60), fontSize: 34.0),
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
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      size: 22,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Lokasi",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Material(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: DropdownButtonHideUnderline(
                        child: StreamBuilder<ApiResponse<KandangResponseModel>>(
                          stream: _bloc.kandangResponseModelStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              switch (snapshot.data.status) {
                                case Status.LOADING:
                                  // return Center(child: Text("loading..."));
                                  break;
                                case Status.COMPLETED:
                                  return DropdownButton<Kandang>(
                                    isExpanded: true,
                                    hint: Text("Pilih lokasi"),
                                    value: _placeSelected,
                                    items: snapshot.data.data.data.map((map) {
                                      return DropdownMenuItem<Kandang>(
                                        value: map,
                                        child: Text(map.placeName),
                                      );
                                    }).toList(),
                                    onChanged: (Kandang value) {
                                      setState(() {
                                        _placeSelected = value;
                                        _categoryBloc.fetchCategory(value.placeId);
                                      });
                                    },
                                  );
                                  break;
                                case Status.ERROR:
                                  return Container();
                                  break;
                              }
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: StreamBuilder<ApiResponse<CategoryResponseModel>>(
            stream: _categoryBloc.categoryResponseModelStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return ProfileSkeleton(
                      height: 200.0,
                      width: 180.0,
                    );
                    break;
                  case Status.COMPLETED:
                    return snapshot.data.data.data.length != 0
                        ? ListView.builder(
                            itemCount: snapshot.data.data.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0,
                                    right: 14.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Material(
                                  elevation: 0.1,
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/detail');
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Material(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(10),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color(
                                                                    0x20000000),
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    0, 3))
                                                          ],
                                                          // border: Border.all(color: Color(0xFFFF0054))
                                                        ),
                                                        child: snapshot
                                                                .data
                                                                .data
                                                                .data[index]
                                                                .images
                                                                .contains(
                                                                    "http")
                                                            ? Image.network(
                                                                snapshot
                                                                    .data
                                                                    .data
                                                                    .data[index]
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .data
                                                              .data[index]
                                                              .title,
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .data
                                                              .data[index]
                                                              .subtitle,
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colors
                                                                  .black26),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Available",
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12.0),
                                                      child: Icon(
                                                        Icons.videocam,
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12.0),
                                                      child: Text(
                                                        "LOT 1",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                            })
                        : Center(
                            child: Text(
                              "Data not found",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18.0),
                            ),
                          );
                    break;
                  case Status.ERROR:
                    return ErrorPage(
                      errorMessage: snapshot.data.message,
                      onRetryPressed: () =>
                          _categoryBloc.fetchCategory(_placeSelected.placeId),
                    );
                    break;
                }
              }
              return Center(
                child: Text(
                  "Data not found",
                  style:
                      TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
