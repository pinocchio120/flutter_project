import 'package:flutter/material.dart';
import 'package:flutter_test_1/lo_b/bus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_test_1/lo_b/alm.dart';
import 'package:flutter/services.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:flutter_test_1/Nloging.dart';
//import 'package:flutter_p_k/lo_b/testplus.dart';

//////////
import 'package:firebase_auth/firebase_auth.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<screen> {
  final aakd = Uri.parse('https://www.kevinsaem.com/');

  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  WebViewController? _webViewController;

  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://www.kevinsaem.com/'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
    // TODO: implement initState
    super.initState();
    getCurrentUer();
  }

  void getCurrentUer() {
    try {
      final User = _authentication.currentUser;
      if (User != null) {
        loggedUser = User;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('종료하시겠습니까?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('아니오'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('예'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 255, 235, 144),
          toolbarHeight: 80, // 상단바 높낮이
          elevation: 0.0, // 그림자 제거
          title: Column(
            children: [
              //Padding(padding: EdgeInsets.all(10)),// 상단바 아이콘& 이미지 높낮이 조절
              // InkWell(
              //     onTap: () => setState(() {
              //           launchUrl(
              //             aakd,
              //             mode: LaunchMode.externalApplication,
              //           );
              //         }),
              //     child: Image.asset(
              //       'image/kevinlogo.png',
              //       width: 200,
              //     )),
              // 홈 상단 로고
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  IconButton(
                    onPressed: () => SideSheet.left(
                      body: Container(
                        color: Color.fromARGB(255, 250, 245, 224),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Padding(padding: EdgeInsets.only(bottom: 120)),

                            InkWell(
                                onTap: () => setState(() {
                                      launchUrl(
                                        aakd,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    }),
                                child: Image.asset(
                                  'image/kevinlogo.png',
                                  width: 200,
                                )),
                            Padding(padding: EdgeInsets.all(221.5)),
                            ListTile(
                              leading: Icon(Icons.home),
                              title: Text(
                                '홈',
                                // style: TextStyle(
                                //   color: const Color.fromARGB(255, 58, 86, 165),
                                //),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.notifications_sharp),
                              title: Text('공지&게시판'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) {
                                      return alm(); //변경 필요
                                    },
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text('버스 위치 보기'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) {
                                      return bus(); //변경 필요
                                    },
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('로그아웃'),
                              onTap: () {
                                _authentication.signOut();
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) {
                                      return newlog(); //변경 필요
                                    },
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.power_settings_new_rounded),
                              title: Text('종료'),
                              onTap: () {
                                SystemNavigator.pop();
                              },
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                          ],
                        ),
                      ),
                      context: context,
                    ),
                    icon: const Icon(Icons.view_list),
                    color: const Color.fromARGB(255, 58, 86, 165),
                    iconSize: 27,
                  ),
                  Padding(padding: EdgeInsets.only(right: 32)),
                  // Icon(
                  //   Icons.home,
                  //   color: const Color.fromARGB(255, 58, 86, 165),
                  // ) //페이지 표시용 아이콘
                  InkWell(
                    onTap: () => setState(() {
                      launchUrl(
                        aakd,
                        mode: LaunchMode.externalApplication,
                      );
                    }),
                    child: Image.asset(
                      'image/kevinlogo.png',
                      width: 200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Center(
          child: WebViewWidget(controller: _webViewController!),
        ),
      ),
    );
  }
}
