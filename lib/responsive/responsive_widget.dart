import 'package:flutter/material.dart';
import 'package:ingilizceegitim/responsive/size_information.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget appbar;
  final Widget drawer;
  final Widget bottomNavigationBar;
  final Color backgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget Function(BuildContext context, SizeInformation constraints)
      builder;

  ResponsiveWidget({
    @required this.builder,
    this.appbar,
    this.drawer,
    this.backgroundColor,
    this.scaffoldKey,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInformation sizeInformation = SizeInformation(
      width: width,
      height: height,
      orientation: orientation,
    );

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: appbar,
        endDrawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        body: Builder(
          builder: (context) {
            return builder(context, sizeInformation);
          },
        ),
      ),
    );
  }
}
