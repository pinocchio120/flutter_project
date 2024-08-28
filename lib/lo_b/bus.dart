import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';
//import 'package:get/get.dart';
//import 'package:flutter_test_1/test.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_test_1/lo_b/home.dart';
import 'package:flutter_test_1/lo_b/alm.dart';
import 'package:flutter/services.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_test_1/Nloging.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';

class bus extends StatefulWidget {
  const bus({super.key});

  @override
  State<bus> createState() => _busState();
}

class _busState extends State<bus> {
  WebViewController? _webViewController;

  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://www.google.co.kr/maps/?hl=ko&entry=ttu'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  final loc.Location location = loc.Location();
  //StreamSubscription<loc.Location>? _locationSubscription;

  final _authentication = FirebaseAuth.instance;

  String lat = "";
  String long = "";

  Future<Position> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("aa");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('ab');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('ac');
    }

    return await Geolocator.getCurrentPosition();
  }

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
                                  Navigator.pop(context);
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
                    //   Icons.location_on,
                    //   color: const Color.fromARGB(255, 58, 86, 165),
                    // )
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

                    PopupMenuButton(
                      icon: Icon(Icons.add),
                      iconSize: 34,
                      iconColor: Color.fromARGB(255, 58, 86, 165),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("운행 시작"),
                          onTap: () {
                            _getLocation().then((value) {
                              setState(() {
                                lat = '${value.latitude}';
                                long = '${value.longitude}';
                              });
                            });
                          },
                        ),
                            PopupMenuItem(
                              child: Text("운행 종료"),
                              onTap: () {
                                n
                              },
                            ),
                        //   ],
                        // ),
                        // PopupMenuItem(
                        //   child: Text("알리미"),
                        //   onTap: () {
                        //     ////_stopListening();
                        //   },
                        // ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: [
                //////////////
                // ElevatedButton(
                //     onPressed: () {
                //       _getLocation().then((value) {
                //         setState(() {
                //           lat = '${value.latitude}';
                //           long = '${value.longitude}';
                //         });
                //       });
                //     },
                //     child: const Text("현재 위치 보기")),
                // Text('latitude: $lat , Longitude: $long'),  ////// 위치
                ////////////////
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('location')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                snapshot.data!.docs[index]['name'].toString()),
                            subtitle: Row(
                              children: [
                                Text(snapshot.data!.docs[index]['latitude']
                                    .toString()),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(snapshot.data!.docs[index]['longitude']
                                    .toString()),
                              ],
                            ),
                            // trailing: IconButton(
                            //   icon: Icon(Icons.directions),
                            //   onPressed: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => MyApp()));
                            //   },
                            // ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )//google maps로 받을경우 위도 경도를 사용 -> locacion 등으로 현재 좌표를 받는 것으로 해결
        ),
      );
    }

  _ge()async{
    try{
      // final loc.Location _locationResult = await location.getLocation();
      var locationData = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({'latitude': locationData.latitude,
      'longitude': locationData.longitude,
      'name':'john'},
      SetOptions(merge:true));
    } catch (e) {}
  }
}


// child: Column(
// children: [
// ElevatedButton(
// onPressed: () {
// _getLocation().then((value) {
// setState(() {
// lat = '${value.latitude}';
// long = '${value.longitude}';
// });
// });
// },
// child: const Text("현재 위치 보기")),
// Text('latitude: $lat , Longitude: $long')
// ],
// ),