import 'package:flutter/material.dart';

class ProfileSkeleton extends StatefulWidget {
  final double height;
  final double width;

  ProfileSkeleton({Key key, this.height, this.width}) : super(key: key);

  createState() => ProfileSkeletonState();
}

class ProfileSkeletonState extends State<ProfileSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0, right: 18.0),
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black12
                    ])),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:18.0, right: 18.0),
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black12
                    ])),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
            SizedBox(
              height: 40.0,
            ),
            buildSkeleton(context),
          ],
        ),
      ),
    );
  }

  Padding buildSkeleton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment(gradientPosition.value, 0),
                    end: Alignment(-1, 0),
                    colors: [Colors.black12, Colors.black26, Colors.black12])),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black12
                    ])),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black12
                    ])),
              )
            ],
          )
        ],
      ),
    );
  }
}
