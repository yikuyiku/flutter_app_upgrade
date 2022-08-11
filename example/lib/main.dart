import 'package:flutter/material.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppUpgradeInfo appUpgradeInfo = AppUpgradeInfo(
                title: "1.0.1",
                contents: ["更新"],
                apkDownloadUrl:
                    "https://sw-lcomg.oss-ap-southeast-1.aliyuncs.com/images/9596dbc1a0753b0c161a2357b82036ed.apk",
                force: true);

            return AppUpgrade.appUpgrade(
              context,
              appUpgradeInfo,
              cancelText: 'Ignore',
              okText: 'Upgrade now',
              iosAppId: '1590847394',
              appMarketInfo:
                  const AppMarketInfo("", "com.sharing.app.edian", ""),
              onCancel: () {},
              onOk: () {
                // FlutterUpgrade.toMarket(appMarketInfo:AppMarketInfo("", "com.sharing.app.edian", ""));
              },
              progressBarColor: Colors.lightBlue.withOpacity(.4),
              downloadProgress: (count, total) {},
              downloadStatusChange: (DownloadStatus status, {dynamic error}) {},
            );
          },
          child: Text("Upgrade"),
        ),
      ),
    );
  }
}
