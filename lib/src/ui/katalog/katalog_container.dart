import 'package:flutter/material.dart';
import 'package:kandangapp/models/katalog_response_model.dart';

class KatalogContainer extends StatelessWidget {

  final List<Katalog> katalog;

  const KatalogContainer({Key key, this.katalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: katalog.length,
        itemBuilder: (context, index){
          print("index: $index");
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                      // border: Border.all(color: Color(0xFFFF0054))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Material(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                  child: Container(
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
                                      // border: Border.all(color: Color(0xFFFF0054))
                                    ),
                                    child: katalog[index].images.contains("http") ? Image.network(katalog[index].images) : Image.asset(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(katalog[index].katalogName,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(katalog[index].harga,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black26
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Available",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black
                                      ),
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
                                  padding: const EdgeInsets.only(top:12.0),
                                  child: Icon(
                                    Icons.videocam,
                                    color: Colors.black26,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:12.0),
                                  child: Text("LOT 1",
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
            ),
          );
        }
      );
      // body: ListView(
      //   children: <Widget>[
      //     SizedBox(height: 30.0,),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         elevation: 0.1,
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, '/detail');
      //           },
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 2,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color(0x20000000),
      //                       blurRadius: 5,
      //                       offset: Offset(0, 3))
      //                 ],
      //                 // border: Border.all(color: Color(0xFFFF0054))
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Material(
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                                 boxShadow: [
      //                                   BoxShadow(
      //                                       color: Color(0x20000000),
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 3))
      //                                 ],
      //                                 // border: Border.all(color: Color(0xFFFF0054))
      //                               ),
      //                               child: Image.asset(
      //                                   'assets/images/goat1.jpg',
      //                                   //fit: BoxFit.fill,
      //                                   // height: 200,
      //                                 ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: <Widget>[
      //                               Text("Type ABC",
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("8 KG",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black26
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("Available",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(10.0),
      //                       child: Row(
      //                         children: <Widget>[
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Icon(
      //                               Icons.videocam,
      //                               color: Colors.black26,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Text("LOT 1",
      //                               style: TextStyle(
      //                                 color: Colors.black26,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //           ),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         elevation: 0.1,
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, '/detail');
      //           },
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 2,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color(0x20000000),
      //                       blurRadius: 5,
      //                       offset: Offset(0, 3))
      //                 ],
      //                 // border: Border.all(color: Color(0xFFFF0054))
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Material(
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                                 boxShadow: [
      //                                   BoxShadow(
      //                                       color: Color(0x20000000),
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 3))
      //                                 ],
      //                                 // border: Border.all(color: Color(0xFFFF0054))
      //                               ),
      //                               child: Image.asset(
      //                                   'assets/images/goat2.jpg',
      //                                   fit: BoxFit.fill,
      //                                   height: 200,
      //                                   width: 100,
      //                                 ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: <Widget>[
      //                               Text("Type XYZ",
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("8 KG",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black26
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("Available",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(10.0),
      //                       child: Row(
      //                         children: <Widget>[
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Icon(
      //                               Icons.videocam,
      //                               color: Colors.black26,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Text("LOT 2",
      //                               style: TextStyle(
      //                                 color: Colors.black26,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //           ),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         elevation: 0.1,
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, '/detail');
      //           },
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 2,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color(0x20000000),
      //                       blurRadius: 5,
      //                       offset: Offset(0, 3))
      //                 ],
      //                 // border: Border.all(color: Color(0xFFFF0054))
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Material(
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                                 boxShadow: [
      //                                   BoxShadow(
      //                                       color: Color(0x20000000),
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 3))
      //                                 ],
      //                                 // border: Border.all(color: Color(0xFFFF0054))
      //                               ),
      //                               child: Image.asset(
      //                                   'assets/images/goat3.jpeg',
      //                                   fit: BoxFit.fill,
      //                                   height: 200,
      //                                   width: 100,
      //                                 ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: <Widget>[
      //                               Text("Type 123",
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("8 KG",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black26
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("Available",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(10.0),
      //                       child: Row(
      //                         children: <Widget>[
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Icon(
      //                               Icons.videocam,
      //                               color: Colors.black26,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Text("LOT 3",
      //                               style: TextStyle(
      //                                 color: Colors.black26,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //           ),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         elevation: 0.1,
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, '/detail');
      //           },
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 2,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color(0x20000000),
      //                       blurRadius: 5,
      //                       offset: Offset(0, 3))
      //                 ],
      //                 // border: Border.all(color: Color(0xFFFF0054))
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Material(
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                                 boxShadow: [
      //                                   BoxShadow(
      //                                       color: Color(0x20000000),
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 3))
      //                                 ],
      //                                 // border: Border.all(color: Color(0xFFFF0054))
      //                               ),
      //                               child: Image.asset(
      //                                   'assets/images/goat4.jpeg',
      //                                   fit: BoxFit.fill,
      //                                   height: 200,
      //                                   width: 100,
      //                                 ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: <Widget>[
      //                               Text("Type 556",
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("8 KG",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black26
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("Unavailable",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(10.0),
      //                       child: Row(
      //                         children: <Widget>[
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Icon(
      //                               Icons.videocam,
      //                               color: Colors.black26,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Text("LOT 4",
      //                               style: TextStyle(
      //                                 color: Colors.black26,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //           ),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Material(
      //         elevation: 0.1,
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.pushNamed(context, '/detail');
      //           },
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 2,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color(0x20000000),
      //                       blurRadius: 5,
      //                       offset: Offset(0, 3))
      //                 ],
      //                 // border: Border.all(color: Color(0xFFFF0054))
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Material(
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                             child: Container(
      //                               decoration: BoxDecoration(
      //                                 color: Colors.white,
      //                                 borderRadius: BorderRadius.all(
      //                                   Radius.circular(10),
      //                                 ),
      //                                 boxShadow: [
      //                                   BoxShadow(
      //                                       color: Color(0x20000000),
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 3))
      //                                 ],
      //                                 // border: Border.all(color: Color(0xFFFF0054))
      //                               ),
      //                               child: Image.asset(
      //                                   'assets/images/goat4.jpeg',
      //                                   fit: BoxFit.fill,
      //                                   height: 200,
      //                                   width: 100,
      //                                 ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: <Widget>[
      //                               Text("Type 556",
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("8 KG",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black26
      //                                 ),
      //                               ),
      //                               SizedBox(height: 10,),
      //                               Text("Unavailable",
      //                                 style: TextStyle(
      //                                   fontSize: 14.0,
      //                                   color: Colors.black
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(10.0),
      //                       child: Row(
      //                         children: <Widget>[
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Icon(
      //                               Icons.videocam,
      //                               color: Colors.black26,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top:12.0),
      //                             child: Text("LOT 4",
      //                               style: TextStyle(
      //                                 color: Colors.black26,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //           ),
      //         ),
      //       ),
      //     ),
          
      //   ],
      // ),
    
  }
}