import 'package:flutter/material.dart';
import 'package:flutter_test_1/lo_b/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_test_1/paleet/color.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_p_k/lo_b/home.dart';
//import 'package:flutter_p_k/lo_b/testplus.dart';
import 'package:flutter/services.dart';

class newlog extends StatefulWidget {
  const newlog({super.key});

  @override
  State<newlog> createState() => _newlogState();
}

class _newlogState extends State<newlog> {
  final _authentication = FirebaseAuth.instance;

  bool aaa = true;
  bool isloginScreen = true;
  final aakd = Uri.parse('https://www.kevinsaem.com/');
  //final ddka = Uri.parse('http://kevinsaem.cafe24.com/dongne/signin.asp');
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  //WebViewController? _webViewController;

  // void initState() {
  //   _webViewController = WebViewController()
  //     ..loadRequest(Uri.parse('http://kevinsaem.cafe24.com/dongne/signin.asp'))
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted);
  //   super.initState();
  // }

  String userName = '';
  String userEmail = '';
  String userpassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
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
    final aad = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 235, 144),
                        width: double.infinity,
                        height: aad.height * 0.4,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        width: double.infinity,
                        child: InkWell(
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
                      ),
                    ],
                  ),
                ),
              ),
              //배경
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                top: 220,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: isloginScreen ? 275 : 400,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 0.4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isloginScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    '로그인',
                                    style: TextStyle(
                                      fontFamily: 'ccc',
                                      fontSize: 16,
                                      color: isloginScreen
                                          ? Color.fromARGB(255, 58, 86, 165)
                                          : palette.textColor1,
                                    ),
                                  ),
                                  if (isloginScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 2,
                                      width: 55,
                                      color: Color.fromARGB(255, 75, 189, 79),
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isloginScreen = false;
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '회원가입',
                                    style: TextStyle(
                                      fontFamily: 'ccc',
                                      color: !isloginScreen
                                          ? Color.fromARGB(255, 58, 86, 165)
                                          : palette.textColor1,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (!isloginScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 2,
                                      width: 75,
                                      color: Color.fromARGB(255, 75, 189, 79),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isloginScreen)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // TextFormField(
                                  //   key: ValueKey(1),
                                  //   validator: (Value) {
                                  //     if (Value!.isEmpty) {
                                  //       return '이름을 작성해주세요.';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   onSaved: (value) {
                                  //     userName = value!;
                                  //   },
                                  //   onChanged: (value) {
                                  //     userName = value;
                                  //   },
                                  //   decoration: const InputDecoration(
                                  //       prefixIcon: Icon(
                                  //         Icons.account_circle,
                                  //         color: palette.iconColor,
                                  //       ),
                                  //       // enabledBorder: OutlineInputBorder(
                                  //       //   borderSide: BorderSide(
                                  //       //       color: palette.textColor1),
                                  //       //   borderRadius: BorderRadius.all(
                                  //       //       Radius.circular(15)),
                                  //       // ),
                                  //       // focusedBorder: OutlineInputBorder(
                                  //       //   borderSide: BorderSide(
                                  //       //       color: palette.textColor1),
                                  //       //   borderRadius: BorderRadius.all(
                                  //       //       Radius.circular(15)),
                                  //       // ),
                                  //       //hintText: '이름',
                                  //       labelText: '이름',
                                  //       hintStyle: TextStyle(
                                  //           fontFamily: 'bool',
                                  //           fontSize: 15,
                                  //           color: palette.textColor1),
                                  //       contentPadding: EdgeInsets.all(10)),
                                  //   controller: controller,
                                  // ),
                                  // //
                                  // Padding(padding: EdgeInsets.all(10)),
                                  //
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(2),
                                    //validator: (Value) {
                                    // if (Value!.isEmpty ||
                                    //     Value.contains('@')) {
                                    //   return '이메일을 다시 한번 확인해 주세요.';
                                    // }
                                    // return null;
                                    //},
                                    onSaved: (Value) {
                                      userEmail = Value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: palette.iconColor,
                                        ),
                                        labelText: '이메일',
                                        hintStyle: TextStyle(
                                            fontFamily: 'ccc',
                                            fontSize: 20,
                                            color: palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                    controller: controller2,
                                  ),
                                  //////////////////////////////////////
                                  Padding(padding: EdgeInsets.all(10)),
                                  //////////////////////////////////////
                                  TextFormField(
                                    obscureText: aaa,
                                    controller: controller3,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    key: ValueKey(3),
                                    // validator: (Value) {
                                    //   if (Value!.isEmpty || Value.length < 4) {
                                    //     return '올바른 번호를 작성해주세요.';
                                    //   }
                                    //   return null;
                                    // },
                                    onSaved: (Value) {
                                      userpassword = Value!;
                                    },
                                    onChanged: (value) {
                                      userpassword = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: palette.iconColor,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            aaa = !aaa;
                                          });
                                        },
                                        child: Icon(
                                          aaa
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: palette.textColor1,
                                        ),
                                      ),
                                      labelText: '비밀번호',
                                      hintStyle: TextStyle(
                                          fontFamily: 'ccc',
                                          fontSize: 20,
                                          color: palette.textColor1),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      //재발급
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (!isloginScreen)
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: ValueKey(4),
                                    validator: (Value) {
                                      if (Value!.isEmpty || Value.length < 2) {
                                        return '2글자 이상 작성해 주세요.';
                                      }
                                      return null;
                                    },
                                    onSaved: (Value) {
                                      userName = Value!;
                                    },
                                    onChanged: (Value) {
                                      userName = Value;
                                    },
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        hintText: '회원 이름',
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(5),
                                    validator: (Value) {
                                      if (Value!.isEmpty ||
                                          Value.contains("@")) {
                                        return '이메일을 다시 한번 확인해 주세요.';
                                      }
                                      return null;
                                    },
                                    onSaved: (Value) {
                                      userEmail = Value!;
                                    },
                                    onChanged: (Value) {
                                      userEmail = Value;
                                    },
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.local_post_office,
                                          color: palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        hintText: '이메일',
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 12)),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(6),
                                    validator: (Value) {
                                      if (Value!.isEmpty || Value.length < 6) {
                                        return '6자 이상으로 작성해주세요.';
                                      }
                                      return null;
                                    },
                                    onSaved: (Value) {
                                      userpassword = Value!;
                                    },
                                    onChanged: (Value) {
                                      userpassword = Value;
                                    },
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.local_post_office,
                                          color: palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        hintText: '비밀번호',
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            color: palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  // Padding(padding: EdgeInsets.only(top: 7)),
                                  // TextFormField(
                                  //   keyboardType: TextInputType.numberWithOptions(
                                  //       decimal: true), //숫자만 사용가능
                                  //   key: ValueKey(6),
                                  //   validator: (Value) {
                                  //     if (Value!.isEmpty ||
                                  //         Value.length < 11 ||
                                  //         Value.length > 12) {
                                  //       return '다시 확인해주세요.';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   onSaved: (Value) {
                                  //     userName = Value!;
                                  //   }, //조건
                                  //   decoration: const InputDecoration(
                                  //     prefixIcon: Icon(
                                  //       Icons.account_circle,
                                  //       color: palette.iconColor,
                                  //     ), // 전호번호 아이콘
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide:
                                  //           BorderSide(color: palette.textColor1),
                                  //       borderRadius:
                                  //           BorderRadius.all(Radius.circular(15)),
                                  //     ), //평소 Textformfield 외형
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide:
                                  //           BorderSide(color: palette.textColor1),
                                  //       borderRadius:
                                  //           BorderRadius.all(Radius.circular(15)),
                                  //     ), //Textformfield를 사용할때 외형
                                  //     hintText: '부모님 전화번호',
                                  //     hintStyle: TextStyle(
                                  //         fontSize: 15,
                                  //         color: palette.textColor1),
                                  //     contentPadding: EdgeInsets.all(10),
                                  //   ),
                                  // ),//부모님 전화번호 textform
                                  // Padding(padding: EdgeInsets.only(top: 7)),
                                  // TextFormField(
                                  //   keyboardType: TextInputType.numberWithOptions(
                                  //       decimal: true), //숫자만 사용가능
                                  //   key: ValueKey(7),
                                  //   validator: (Value) {
                                  //     if (Value!.isEmpty ||
                                  //         Value.length < 11 ||
                                  //         Value.length > 12) {
                                  //       return '다시 확인해주세요.';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   onSaved: (Value) {
                                  //     userName = Value!;
                                  //   }, //조건
                                  //   decoration: const InputDecoration(
                                  //       prefixIcon: Icon(
                                  //         Icons.account_circle,
                                  //         color: palette.iconColor,
                                  //       ), // 전호번호 아이콘
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: palette.textColor1),
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(15)),
                                  //       ), //평소 Textformfield 외형
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: palette.textColor1),
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(15)),
                                  //       ), //Textformfield를 사용할때 외형
                                  //       hintText: '수강생 전화번호',
                                  //       hintStyle: TextStyle(
                                  //           fontSize: 15,
                                  //           color: palette.textColor1),
                                  //       contentPadding: EdgeInsets.all(10)),
                                  // ),//수강생 전화번호 textform
                                  // Padding(padding: EdgeInsets.only(top: 7)),
                                  // TextFormField(
                                  //   key: ValueKey(8),
                                  //   validator: (Value) {
                                  //     if (Value!.isEmpty ||
                                  //         Value.contains("초") ||
                                  //         Value.contains("중") ||
                                  //         Value.contains("고") ||
                                  //         Value.length < 2) {
                                  //       return '다시 확인 해주세요.';
                                  //     }
                                  //     return null;
                                  //   },
                                  //   onSaved: (Value) {
                                  //     userName = Value!;
                                  //   },
                                  //   decoration: const InputDecoration(
                                  //       prefixIcon: Icon(
                                  //         Icons.account_circle,
                                  //         color: palette.iconColor,
                                  //       ),
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: palette.textColor1),
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(15)),
                                  //       ),
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: palette.textColor1),
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(15)),
                                  //       ),
                                  //       hintText: '학교',
                                  //       hintStyle: TextStyle(
                                  //           fontSize: 15,
                                  //           color: palette.textColor1),
                                  //       contentPadding: EdgeInsets.all(10)),
                                  // ), //학교 textform
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              //로그인 & 회원가입
              AnimatedPositioned(
                duration: Duration(milliseconds: 300), //애니메이션 속도
                curve: Curves.easeIn,
                top: isloginScreen ? 455 : 580,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          //spreadRadius: 0.0001,
                          //blurRadius: 10,
                          //offset: Offset(0, 15),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // _tryValidation();
                        // print(userName);
                        // print(userEmail);
                        // print(userpassword); //print 회원가입 정보
                        if (!isloginScreen) {
                          _tryValidation();

                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                              email: userEmail,
                              password: userpassword,
                            );
                            if (newUser.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return screen();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            // print(e);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text("이메일과 비밀번호를 확인해주세요"),
                            //     backgroundColor: Color.fromARGB(255, 201, 0, 0),
                            //   ),
                            // );
                          }
                        }
                        if (isloginScreen) {
                          _tryValidation();

                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                                    email: userEmail, password: userpassword);

                            if (newUser.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return screen();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("이메일과 비밀번호를 확인해주세요"),
                                backgroundColor:
                                    Color.fromARGB(255, 250, 39, 39),
                              ),
                            );
                          }
                        }

                        // if (controller.text == 'aaa' &&
                        //     controller2.text == '2609') {
                        //   Navigator.pushReplacementNamed(context, 'mhome');
                        // } else if (controller.text == 'aaa' &&
                        //     controller2.text != '2609') {
                        //   showSnackBar(
                        //       context,
                        //       Text('인증번호를 확인해 주세요(4자 이상)',
                        //           style: TextStyle(fontFamily: 'bool')));
                        // } else if (controller.text != 'aaa' &&
                        //     controller2.text == '2609') {
                        //   showSnackBar(
                        //       context,
                        //       Text('이름을 확인해 주세요(3자 이상)',
                        //           style: TextStyle(fontFamily: 'bool')));
                        // } else {
                        //   showSnackBar(
                        //       context,
                        //       Text('정확하게 작성하였는지 확인해 주세요.',
                        //           style: TextStyle(
                        //               fontFamily: 'bool', fontSize: 17)));
                        // }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 58, 86, 165),
                              Color.fromARGB(255, 75, 189, 79),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.3),
                              spreadRadius: 0.4,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ), // 아이디와 비밀번호 관리 코드
                  ),
                ),
              ),
              //버튼
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 201, 0, 0),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
} //일치하지 않을 시 작동
