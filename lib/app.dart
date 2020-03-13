import 'package:chiyell_mobile/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHiYELL',
      theme: themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  ページ切り替え用のコントローラを宣言
  PageController _pageController;

//  ページインデックス保持する変数を宣言
  int _page = 0;

//  ボトムナビゲーションの一覧を宣言
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.folder_open), title: Text('資料')),
      BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('講師')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _page, // 初期ページの設定
    );
  }

  @override
  void dispose() {
    super.dispose();
    // コントローラ破棄
    _pageController.dispose();
  }

//  ロゴアイコンの宣言
  Image appLogo = new Image(
    image: new ExactAssetImage('assets/img/ic_main_logo.png'),
    height: 28.0,
    alignment: FractionalOffset.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
//        leading: Icon(Icons.notifications, color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Text('hogehoge'),
          Text('hogehogegegheoge'),
          Text('momo'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
//        現在のページインデックス
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: bottomItems(),
      ),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
