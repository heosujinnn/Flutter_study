import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';
import 'package:flutter_practice/common/const/data.dart';
import 'package:flutter_practice/common/layout/default_layout.dart';
import 'package:flutter_practice/common/view/root_tab.dart';
import 'package:flutter_practice/user/view/login_screen.dart';
import 'package:dio/dio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //deleteToken();
    checkToken();
  }

  void checkToken() async {
    // storage에서 가져오기
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    try {
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        ),
      );
      //발급 받은 토큰 저장 : 앱 재 실행 시 토큰 갱신되게 한거임.
      //바디 값 안의 어세스 토큰을 저장
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);

      
      // 토큰 정상 200 이면 로그인페이지로
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
     }
    // 만료 됐으면 로그인페이지로
    catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false);
    }
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
