import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_test_1/lo_b/home.dart';
import 'package:flutter_test_1/lo_b/bus.dart';
import 'package:flutter/services.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:flutter_test_1/lo_b/alm.dart';

import 'package:flutter_test_1/Nloging.dart';

import 'package:firebase_auth/firebase_auth.dart';

class aml extends StatefulWidget {
  const aml({super.key});

  @override
  State<aml> createState() => _amlState();
}

class _amlState extends State<aml> {
  @override
  Widget build(BuildContext context) {
    final aakd = Uri.parse('https://www.kevinsaem.com/');

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

    final _authentication = FirebaseAuth.instance;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 255, 235, 144),
          toolbarHeight: 80,
          title: Column(
            children: [
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
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) {
                                      return screen(); //변경 필요
                                    },
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.notifications_sharp),
                              title: Text('공지&게시판'),
                              onTap: () => {
                                Navigator.pop(context),
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
                  Padding(padding: EdgeInsets.only(right: 37)),
                  // Icon(
                  //   Icons.notifications_sharp,
                  //   color: const Color.fromARGB(255, 58, 86, 165),
                  // )
                  //페이지 표시용 아이콘
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

                                        Padding(padding: EdgeInsets.only(right: 25)),

                  /////////////////////////////////////////////////////////////

                  PopupMenuButton(
                    icon: Icon(Icons.add),
                    iconSize: 34,
                    iconColor: Color.fromARGB(255, 58, 86, 165),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("글 작성"),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return aml(); //변경 필요
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: Text("알리미"),
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
                      PopupMenuItem(
                        child: Text("질문"),
                        onTap: () {
                          _successMessage(context);
                        },
                      ),
                    ],
                  ),
                  //////////////////////////////////////////////////////////////////////////////////////

                ],
              )
            ],
          ),
        ),
        body: Center(
          child: Text('자유 게시판'),
        ),
      ),
    );
  }
}

_successMessage(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Text(
            '알리미로 이동할까요?',
            style: TextStyle(
                color: Colors.black, fontSize: 13.4, fontFamily: 'sch'),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3),
          ),
        ],
      ),
      action: SnackBarAction(
        label: '바로가기',
        textColor: Colors.black,
        onPressed: () {
          //Action 을 누르면 다른 페이지로 이동
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) {
                return aml(); //변경 필요
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
      ),
      behavior: SnackBarBehavior.floating, //위로 약간 띄우기
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), //모서리 제거
      ),

      backgroundColor: const Color.fromARGB(255, 255, 235, 144), //배경색상

      width: 300, //세로 넓이

      elevation: 0.0, //그림자 제거
    ),

    // padding: const EdgeInsets.symmetric(
    //   horizontal: 600.0, //세로 높이
    // ),
  );
}
