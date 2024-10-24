import 'package:flutter/material.dart';
import 'package:islam_instegram/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Resposive extends StatefulWidget {
  final Widget myMobileScreen;
  final Widget myWebScreen;

  const Resposive(
      {super.key, required this.myMobileScreen, required this.myWebScreen});

  @override
  State<Resposive> createState() => _ResposiveState();
}

class _ResposiveState extends State<Resposive> {
  // To get data from DB using provider
  getDataFromDB() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    getDataFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
      if (boxConstraints.maxWidth > 600) {
        return widget.myWebScreen;
      } else {
        return widget.myMobileScreen;
      }
    });
  }
}

aaa(double x, double y) {
  return x * y;
}
