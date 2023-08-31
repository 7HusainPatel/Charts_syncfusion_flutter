import 'package:flutter/material.dart';

import 'common_widgets.dart';

class PBMainContainer extends StatelessWidget {
  final String? appBarTitle;
  final Widget child;
  final List<Widget>? actions;
  final bool isAppBar;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final Widget? floatingActionButton;
  final double? padding, elevation;
  final Widget? bottomNavigationBar;

  const PBMainContainer(
      {Key? key,
      required this.child,
      this.backgroundColor,
      this.appBarTitle,
      this.isAppBar = true,
      this.actions,
      this.floatingActionButton,
      this.padding,
      this.elevation,
      this.appBarBackgroundColor,
      this.leading,
      this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      appBar: isAppBar == true
          ? AppBar(
              leading: leading,
              elevation: elevation ?? 0.0,
              backgroundColor:
                  appBarBackgroundColor ?? Theme.of(context).primaryColor,
              centerTitle: true,
              actions: actions,
              iconTheme: Theme.of(context).iconTheme,
              title: Text(appBarTitle ?? '',
                  style: Theme.of(context).textTheme.bodyText1),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ltrb(all: padding ?? 0.0),
          child: child,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
