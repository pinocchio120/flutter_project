import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_1/Nloging.dart';
import 'package:flutter_test_1/lo_b/home.dart';
//import 'package:flutter_test_1/test.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBH6cMSr6UPOw82I59DV-pQ-PBoVY6ciU8",
            appId: "1:896702744781:android:39b6df1010bcb255100184",
            messagingSenderId: "896702744781",
            projectId: "project-5b17f",
          ),
        )
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project_K',
      routes: {
        'mhome': (_) => screen(),
      }, //비밀 번호와 이름이 일치할 시 home으로
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const newlog(),
      //home: GeolocatorWidget(),
    );
  }
}

// class newlog extends StatefulWidget {
//   const newlog({super.key});

//   @override
//   State<newlog> createState() => _newlogState();
// }

// class _newlogState extends State<newlog> {   
//   bool isSignupScreen = true;
//   bool babb = true;
//   final aakd = Uri.parse('https://www.kevinsaem.com/');
//   //final ddka = Uri.parse('http://kevinsaem.cafe24.com/dongne/signin.asp');
//   final _formKey = GlobalKey<FormState>();
//   int num = 010;

//   //WebViewController? _webViewController;

//   // void initState() {
//   //   _webViewController = WebViewController()
//   //     ..loadRequest(Uri.parse('http://kevinsaem.cafe24.com/dongne/signin.asp'))
//   //     ..setJavaScriptMode(JavaScriptMode.unrestricted);
//   //   super.initState();
//   // }

//   String userName = 'song';
//   String userEmail = '';
//   String userpassword = '2609';

//   void _tryValidation() {
//     final isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final aad = MediaQuery.of(context).size;

//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Stack(
//           children: [
//             Positioned(
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 child: Stack(
//                   children: [
//                     Container(
//                       color: const Color.fromARGB(255, 255, 235, 144),
//                       width: double.infinity,
//                       height: aad.height * 0.4,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 100),
//                       width: double.infinity,
//                       child: InkWell(
//                         onTap: () => setState(() {
//                           launchUrl(
//                             aakd,
//                             mode: LaunchMode.externalApplication,
//                           );
//                         }),
//                         child: Image.asset(
//                           'image/kevinlogo.png',
//                           width: 200,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //배경
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeIn,
//               top: 220,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 curve: Curves.easeIn,
//                 height: isSignupScreen ? 280 : 400,
//                 width: MediaQuery.of(context).size.width - 40,
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12.withOpacity(0.2),
//                       blurRadius: 10,
//                       spreadRadius: 0.4,
//                       offset: Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.only(bottom: 20),
//                   child: Column(
//                     children: [
//                       Padding(padding: EdgeInsets.all(8)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isSignupScreen = true;
//                               });
//                             },
//                             child: Column(
//                               children: [
//                                 Text(
//                                   '로그인',
//                                   style: TextStyle(
//                                     fontFamily: 'ccc',
//                                     fontSize: 16,
//                                     color: isSignupScreen
//                                         ? Color.fromARGB(255, 58, 86, 165)
//                                         : palette.textColor1,
//                                   ),
//                                 ),
//                                 if (isSignupScreen)
//                                   Container(
//                                     margin: EdgeInsets.only(top: 5),
//                                     height: 2,
//                                     width: 55,
//                                     color: Color.fromARGB(255, 75, 189, 79),
//                                   ),
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isSignupScreen = false;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   '회원가입',
//                                   style: TextStyle(
//                                     fontFamily: 'ccc',
//                                     color: !isSignupScreen
//                                         ? Color.fromARGB(255, 58, 86, 165)
//                                         : palette.textColor1,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 if (!isSignupScreen)
//                                   Container(
//                                     margin: EdgeInsets.only(top: 5),
//                                     height: 2,
//                                     width: 75,
//                                     color: Color.fromARGB(255, 75, 189, 79),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       if (isSignupScreen)
//                         Container(
//                           margin: EdgeInsets.only(top: 10),
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   key: ValueKey(1),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty || Value.length < 2) {
//                                       return '2글자 이상 작성해 주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (value) {
//                                     userName = value!;
//                                   },
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.account_circle,
//                                         color: palette.iconColor,
//                                       ),
//                                       // enabledBorder: OutlineInputBorder(
//                                       //   borderSide: BorderSide(
//                                       //       color: palette.textColor1),
//                                       //   borderRadius: BorderRadius.all(
//                                       //       Radius.circular(15)),
//                                       // ),
//                                       // focusedBorder: OutlineInputBorder(
//                                       //   borderSide: BorderSide(
//                                       //       color: palette.textColor1),
//                                       //   borderRadius: BorderRadius.all(
//                                       //       Radius.circular(15)),
//                                       // ),
//                                       //hintText: '이름',
//                                       labelText: '이름',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                                 //
//                                 Padding(padding: EdgeInsets.all(13)),
//                                 //
//                                 TextFormField(
//                                   obscureText: babb,
//                                   key: ValueKey(2),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty || Value.length < 4) {
//                                       return '존재하지 않는 번호입니다.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userpassword = Value!;
//                                   },
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.lock,
//                                         color: palette.iconColor,
//                                       ),
//                                       // enabledBorder: OutlineInputBorder(
//                                       //   borderSide: BorderSide(
//                                       //       color: palette.textColor1),
//                                       //   borderRadius: BorderRadius.all(
//                                       //       Radius.circular(15)),
//                                       // ),
//                                       // focusedBorder: OutlineInputBorder(
//                                       //   borderSide: BorderSide(
//                                       //       color: palette.textColor1),
//                                       //   borderRadius: BorderRadius.all(
//                                       //       Radius.circular(15)),
//                                       // ),
//                                       //hintText: '1234',
//                                       labelText: '인증번호',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                                 Row(
//                                   children: [
//                                     //재발급
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       if (!isSignupScreen)
//                         Container(
//                           margin: const EdgeInsets.only(top: 10),
//                           padding: const EdgeInsets.symmetric(horizontal: 15),
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   key: ValueKey(3),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty || Value.length < 2) {
//                                       return '2글자 이상 작성해 주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userName = Value!;
//                                   },
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.account_circle,
//                                         color: palette.iconColor,
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       hintText: '이름',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 7),
//                                 ),
//                                 TextFormField(
//                                   keyboardType: TextInputType.emailAddress,
//                                   key: ValueKey(4),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty ||
//                                         Value.contains("@gamil.com")) {
//                                       return '이메일을 다시 한번 확인해 주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userEmail = Value!;
//                                   },
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.local_post_office,
//                                         color: palette.iconColor,
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       hintText: '이메일',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                                 Padding(padding: EdgeInsets.only(top: 7)),
//                                 TextFormField(
//                                   keyboardType: TextInputType.numberWithOptions(
//                                       decimal: true), //숫자만 사용가능
//                                   key: ValueKey(5),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty ||
//                                         Value.length < 11 ||
//                                         Value.length > 12) {
//                                       return '다시 확인해주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userName = Value!;
//                                   }, //조건
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.account_circle,
//                                       color: palette.iconColor,
//                                     ), // 전호번호 아이콘
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: palette.textColor1),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(15)),
//                                     ), //평소 Textformfield 외형
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: palette.textColor1),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(15)),
//                                     ), //Textformfield를 사용할때 외형
//                                     hintText: '부모님 전화번호',
//                                     hintStyle: TextStyle(
//                                         fontSize: 15,
//                                         color: palette.textColor1),
//                                     contentPadding: EdgeInsets.all(10),
//                                   ),
//                                 ),
//                                 Padding(padding: EdgeInsets.only(top: 7)),
//                                 TextFormField(
//                                   keyboardType: TextInputType.numberWithOptions(
//                                       decimal: true), //숫자만 사용가능
//                                   key: ValueKey(6),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty ||
//                                         Value.length < 11 ||
//                                         Value.length > 12) {
//                                       return '다시 확인해주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userName = Value!;
//                                   }, //조건
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.account_circle,
//                                         color: palette.iconColor,
//                                       ), // 전호번호 아이콘
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ), //평소 Textformfield 외형
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ), //Textformfield를 사용할때 외형
//                                       hintText: '수강생 전화번호',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                                 Padding(padding: EdgeInsets.only(top: 7)),
//                                 TextFormField(
//                                   key: ValueKey(7),
//                                   validator: (Value) {
//                                     if (Value!.isEmpty ||
//                                         Value.contains("초") ||
//                                         Value.contains("중") ||
//                                         Value.contains("고") ||
//                                         Value.length < 2) {
//                                       return '다시 확인 해주세요.';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (Value) {
//                                     userName = Value!;
//                                   },
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.account_circle,
//                                         color: palette.iconColor,
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: palette.textColor1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(15)),
//                                       ),
//                                       hintText: '학교',
//                                       hintStyle: TextStyle(
//                                           fontSize: 15,
//                                           color: palette.textColor1),
//                                       contentPadding: EdgeInsets.all(10)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             //로그인 & 회원가입
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeIn,
//               top: isSignupScreen ? 460 : 580,
//               right: 0,
//               left: 0,
//               child: Center(
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   height: 90,
//                   width: 90,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12.withOpacity(0.3),
//                         //spreadRadius: 0.0001,
//                         //blurRadius: 10,
//                         //offset: Offset(0, 15),
//                       ),
//                     ],
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacementNamed(context, 'mhome');
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 58, 86, 165),
//                             Color.fromARGB(255, 75, 189, 79),
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12.withOpacity(0.3),
//                             spreadRadius: 0.4,
//                             blurRadius: 1,
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //버튼
//           ],
//         ),
//       ),
//     );
//   }
// }
