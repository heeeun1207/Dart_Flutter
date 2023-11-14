import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  XFile? video;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      body: video==null ? renderEmpty() : renderVideo(),
    );
  }


  Widget renderEmpty(){
    return Container(
      width: MediaQuery.of(context).size.width, // 넓이 최대로 늘려주기
      decoration: getBoxDecoration(), // 그라데이션 함 값 가져오기
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(), // 로고 이미지
          SizedBox(height: 30.0,),
          _AppName(), // 앱 이름
        ],
      ),
    );
  }

  BoxDecoration getBoxDecoration(){
    return BoxDecoration(
      // 그라데이션 색상 적용
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF2A3A7C),
          Color(0xFF000118),
        ],
      ),
    );
  }

  Widget renderVideo(){
    return Container();
  }
}

class _Logo extends StatelessWidget{
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Image.asset(
        'asset/img/logo.png'
    );
  }
}

class _AppName extends StatelessWidget{
  const _AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
          "PLAYER",
          style: textStyle.copyWith(

            // textStyle 에서 두께만 700으로 변경
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}