import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';
import 'package:flutter_practice/common/const/data.dart';
import 'package:flutter_practice/common/layout/default_layout.dart';
import 'package:flutter_practice/common/view/root_tab.dart';
import 'package:flutter_practice/user/view/login_screen.dart';

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

    // 만약에 토큰 비어있으면 로그인 페이지로..
    // TODO : 토큰 유효한지도 체크해야함.
    if (refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false);
    }
    else{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RootTab()),
              (route) => false);
    }
  }

  void deleteToken() async{
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/logo/logo.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
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
