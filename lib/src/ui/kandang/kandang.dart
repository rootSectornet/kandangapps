import 'package:flutter/material.dart';
import 'package:kandangapp/models/kategori_response_model.dart';
import 'package:kandangapp/src/blocs/kategori_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/kandang/kandangContainer.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/profile_skeleton.dart';
import 'package:kandangapp/src/utils/arguments_helper.dart';

class Category extends StatefulWidget {
  final ScreenArguments args;

  const Category({Key key, this.args}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CategoryBloc _bloc = CategoryBloc();
  String placeName = "";
  @override
  void initState() {
    _bloc.fetchCategory(widget.args.id);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFAFAFA),
        title: Container(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[     
                Icon(Icons.arrow_back_ios, color: Colors.black,),
                SizedBox(width: 20.0,),
                Text(
                  "Back ",
                  style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
                ),
              ],
            ),
          ),
        ),
        // title: Container(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         "Kandang " + widget.args.name,
        //         style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
        //       ),
        //     ],
        //   ),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.notifications,
        //       color: Colors.grey[900],
        //     ),
        //     onPressed: () {
        //       print('Click notif');
        //     },
        //   ),
        // ],
      ),
      body: StreamBuilder<ApiResponse<CategoryResponseModel>>(
        stream: _bloc.categoryResponseModelStream,
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
                return KandangContainer(
                  category: snapshot.data.data.data,
                  placeName: widget.args.name,
                );
                break;
              case Status.ERROR:
                return ErrorPage(
                  errorMessage: snapshot.data.message,
                  onRetryPressed: () => _bloc.fetchCategory(widget.args.id),
                );
                break;
            }
          }
          return Container();
        },
      ),
    );
  }
}
